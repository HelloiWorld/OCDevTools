//
//  ZTCJudge.m
//  职通车
//
//  Created by PengZK on 2017/8/11.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "ZTCJudge.h"

#define MOBILE_NUM_REGEX @"^1(2[0-9]|3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$"
#define SMS_CODE_REGEX @"^\\d{4}$" //4位数字验证码
#define InputableTextField_REGEX @"^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+$"

#define NAME_PINYIN_REGEX @"^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$"
#define IDCARD_NUM_REGEX @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)"
/**
 * 正则：身份证号码 15 位
 */
#define REGEX_ID_CARD15 @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$"
/**
 * 正则：身份证号码 18 位
 */
#define REGEX_ID_CARD18 @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])$"

@implementation ZTCJudge

+ (BOOL)isMessageNotificationServiceOpen{
    UIUserNotificationSettings *set = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone != set.types) {
        return YES;
    } else {
        return NO;
    }
    // FIXME : iOS8手机有问题！
    //    return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
}

+ (BOOL)isMobileNumberValid:(NSString *)mobileNum{
    if (!mobileNum || [mobileNum isEqualToString: @""]) {
        return NO;
    }
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE_NUM_REGEX];
    return [regextest evaluateWithObject: mobileNum];
}

+ (BOOL)isSmsCodeValid:(NSString *)smsCode{
    if (!smsCode || [smsCode isEqualToString: @""]) {
        return NO;
    }
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", SMS_CODE_REGEX];
    return [regextest evaluateWithObject: smsCode];
}


+ (BOOL)isInputableTextValid:(NSString *)inputText{
    if (!inputText || [inputText isEqualToString: @""]) {
        return NO;
    }
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", InputableTextField_REGEX];
    return [regextest evaluateWithObject: inputText];
}

//+ (BOOL)isRealNameValid:(NSString *)realName{
//    if (!realName || [realName isEqualToString: @""]) {
//        return NO;
//    }
//    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NAME_PINYIN_REGEX];
//    return [regextest evaluateWithObject: realName];
//}

+ (BOOL)isIDCardNum15Valid:(NSString *)cardNum{
    if (!cardNum || [cardNum isEqualToString: @""]) {
        return NO;
    }
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_ID_CARD15];
    return [regextest evaluateWithObject: cardNum];
}

+ (BOOL)isIDCardNum18Valid:(NSString *)cardNum{
    if (!cardNum || [cardNum isEqualToString: @""]) {
        return NO;
    }
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_ID_CARD18];
    return [regextest evaluateWithObject: cardNum];
}

@end
