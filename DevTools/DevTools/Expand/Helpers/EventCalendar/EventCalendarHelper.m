//
//  EventCalendarHelper.m
//  职通车
//
//  Created by PengZK on 2017/12/28.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "EventCalendarHelper.h"
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>

@implementation EventCalendarHelper

static EventCalendarHelper *calendar;
+ (instancetype)sharedEventCalendar{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [[EventCalendarHelper alloc] init];
    });
    
    return calendar;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [super allocWithZone:zone];
    });
    return calendar;
}

- (void)createEventCalendarTitle:(NSString *)title location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate allDay:(BOOL)allDay alarmArray:(NSArray *)alarmArray{
    __weak typeof(self) weakSelf = self;
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                if (error)
                {
                    [strongSelf showAlertWithMessage:@"添加失败，请稍后重试"];
                    
                }else if (!granted){
//                    [strongSelf showAlert:@"不允许使用日历,请在设置中允许此App使用日历"];
                    [strongSelf showAlertWithTitle:@"无访问日历权限" message:@"您可以在\"设置->职通车\"中打开日历开关" confirmTitle:@"去设置" cancelTitle:@"取消" confirmHandler:^(UIAlertAction *confirmAction) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                    }];
                    
                }else{
                    EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
                    event.title     = title;
                    event.location = location;
                    
                    NSDateFormatter *tempFormatter = [[NSDateFormatter alloc]init];
                    [tempFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
                    
                    event.startDate = startDate;
                    event.endDate   = endDate;
                    event.allDay = allDay;
                    
                    //添加提醒
                    if (alarmArray && alarmArray.count > 0) {
                        
                        for (NSString *timeString in alarmArray) {
                            [event addAlarm:[EKAlarm alarmWithRelativeOffset:[timeString integerValue]]];
                        }
                    }
                    
                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                    NSError *err;
                    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
                    [strongSelf showAlertWithMessage:@"已添加到系统日历中"];
                    
                }
            });
        }];
    }
}

- (void)createReminderTitle:(NSString *)title location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate priority:(int)priority alarmTime:(NSString *)alarmString{
    __weak typeof(self) weakSelf = self;
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                if (error)
                {
                    [strongSelf showAlertWithMessage:@"添加失败，请稍后重试"];
                    
                }else if (!granted){
//                    [strongSelf showAlert:@"不允许使用提醒事项,请在设置中允许此App使用提醒事项"];
                    [strongSelf showAlertWithTitle:@"无访问提醒事项权限" message:@"您可以在\"设置->职通车\"中打开提醒事项开关" confirmTitle:@"去设置" cancelTitle:@"取消" confirmHandler:^(UIAlertAction *confirmAction) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                    }];
                    
                }else{
                    //创建一个提醒功能
                    
                    EKReminder *reminder = [EKReminder reminderWithEventStore:eventStore];
                    reminder.title     = title;
                    reminder.location = location;
                    
                    [reminder setCalendar:[eventStore defaultCalendarForNewReminders]];
                    
                    NSCalendar *cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
                    [cal setTimeZone:[NSTimeZone systemTimeZone]];
                    NSInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
                    
                    NSDateComponents* startDateComp = [cal components:flags fromDate:startDate];
                    reminder.startDateComponents = startDateComp; //开始时间
                    
                    NSDateComponents* endDateComp = [cal components:flags fromDate:endDate];
                    reminder.dueDateComponents = endDateComp; //到期时间

                    reminder.priority = priority; //优先级
                    
                    //添加提醒
                    [reminder addAlarm:[EKAlarm alarmWithAbsoluteDate:[NSDate dateWithTimeInterval:[alarmString integerValue] sinceDate:endDate]]];
                    
                    NSError *err;
                    [eventStore saveReminder:reminder commit:YES error:&err];
                    [strongSelf showAlertWithMessage:title];
                    
                }
            });
        }];
    }
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [self showAlertWithTitle:@"提示" message:message cancelAction:nil confirmAction:okAction];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle cancelTitle:(NSString *)cancelTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    UIAlertAction *cancelAction = cancelTitle ? [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil] : nil;
    UIAlertAction *confirmlAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:handler];
    [self showAlertWithTitle:title message:message cancelAction:cancelAction ? : nil confirmAction:confirmlAction];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelAction:(UIAlertAction *)cancelAction confirmAction:(UIAlertAction *)confirmAction {
    if (cancelAction == nil && confirmAction == nil) return;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    cancelAction != nil ? [alertController addAction:cancelAction] : nil;
    confirmAction != nil ? [alertController addAction:confirmAction] : nil;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

//作者：键盘上的演绎者
//链接：https://www.jianshu.com/p/0aa3f698614e
//來源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

@end
