//
//  ZTCJudge.h
//  职通车
//
//  Created by PengZK on 2017/8/11.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTCJudge : NSObject

/**
 判断是否打开系统推送通知
 
 @return YES:打开 NO:关闭
 */
+ (BOOL)isMessageNotificationServiceOpen;


/**
 手机号正则校验
 
 @param mobileNum 手机号
 @return YES:合法 NO:不合法
 */
+ (BOOL)isMobileNumberValid:(NSString *)mobileNum;


/**
 4位短信验证码校验
 
 @param smsCode 数字验证码
 @return YES:合法 NO:不合法
 */
+ (BOOL)isSmsCodeValid:(NSString *)smsCode;


/**
 是否是允许的文本：只允许输入中文、字母或数字

 @param inputText 输入文本
 @return YES:合法 NO:不合法
 */
+ (BOOL)isInputableTextValid:(NSString *)inputText;


/**
 是否是合法的姓名
 这个校验显然 很难满足所有情况😢，所以先不用
 
 @param realName 真实姓名
 @return YES:合法 NO:不合法
 */
//+ (BOOL)isRealNameValid:(NSString *)realName;


/**
 是否是合法的身份证号

 @param cardNum 身份证号
 @return YES:合法 NO:不合法
 */
+ (BOOL)isIDCardNum15Valid:(NSString *)cardNum;
+ (BOOL)isIDCardNum18Valid:(NSString *)cardNum;

@end
