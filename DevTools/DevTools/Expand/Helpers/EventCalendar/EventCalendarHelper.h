//
//  EventCalendarHelper.h
//  职通车
//
//  Created by PengZK on 2017/12/28.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventCalendarHelper : NSObject

+ (instancetype)sharedEventCalendar;

/**
 *  将App事件添加到系统日历提醒事项，实现闹铃提醒的功能
 *
 *  @param title      事件标题
 *  @param location   事件位置
 *  @param startDate  开始时间
 *  @param endDate    结束时间
 *  @param allDay     是否全天
 *  @param alarmArray 闹钟集合
 */
- (void)createEventCalendarTitle:(NSString *)title location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate allDay:(BOOL)allDay alarmArray:(NSArray *)alarmArray;

/**
 *  将App事件添加到系统提醒事项，实现闹铃提醒的功能
 *
 *  @param title      事件标题
 *  @param location   事件位置
 *  @param startDate  开始时间
 *  @param endDate    结束时间
 *  @param priority   优先级
 *  @param alarmString 闹钟提醒时间
 */
- (void)createReminderTitle:(NSString *)title location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate priority:(int)priority alarmTime:(NSString *)alarmString;

@end
