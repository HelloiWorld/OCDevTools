//
//  NSDate+Format.h
//  职通车
//
//  Created by PengZK on 2018/5/14.
//  Copyright © 2018年 ZTC. All rights reserved.
//
/*
 @"yyyy-MM-dd"                     2107-01-01
 @"yyyy-MM-dd HH:mm:ss.SSS"        2107-01-01 11:24:20:123
 @"yyyy-MM-dd aahh:mm"             2107-01-01 上午11：45
 @"yy-MM-ddEEE aahh:mm"            2107-01-01 星期一 上午11：45
 
 @"yyyy/MM/dd"                     2107/01/01
 @"yyyy-MM-dd HH:mm:ss.SSS"        2107/01/01 11:24:20:123
 @"yyyy/MM/dd aahh:mm"             2107/01/01 上午11：45
 @"yyyy/MM/ddEEE aahh:mm"          2107/01/01 星期一 上午11：45
 
 @"yyyy年MM月dd日 EEEE aahh:mm"     2107年1月1日 星期一 上午11：45
 @"yyyy年MM月dd日 HH:mm"            2107年1月1日 11：45
 
 @"yyyy-MM-dd'T'HH:mm:ss.SSS zz:z" 2016-01-20T17:24:08.000+08:00
 */

/*
 longlong <-- timeInterval --> NSDate <-- NSDateFormatter  --> NSString
 */

#import <Foundation/Foundation.h>

@interface NSDate (Format)

/**
 时间 转 时间字符串
 
 @param date 时间
 @param formatString 时间格式
 @return 时间字符串
 */
+ (NSString *)timeStringFromDate:(NSDate *)date formatString:(NSString *)formatString;


/**
 时间字符串 转 时间
 
 @param timeString 时间字符串
 @param formatString 时间格式
 @return 时间
 */
+ (NSDate *)dateFromTimeString:(NSString *)timeString formatString:(NSString *)formatString;


/**
 时间戳 转 时间
 
 @param timeStamp 时间戳
 @return 时间
 */
+ (NSDate *)dateFromTimestamp:(long long)timeStamp;


/**
 时间字符串 转 时间戳
 
 @param dateStr 时间字符串
 @param formatString 时间格式
 @return 时间戳
 */
+ (long long)longLongFromDateString:(NSString*)dateStr formatString:(NSString *)formatString;


/**
 时间 转 时间戳
 
 @param date 时间
 @return 时间戳
 */
+ (long long)timesTampFromDate:(NSDate *)date;


/**
 时间戳 转 时间字符串
 
 @param timeStamp 时间戳
 @param formatString 时间格式
 @return 时间字符串
 */
+ (NSString *)timeStringFromTimestamp:(long long)timeStamp formatString:(NSString *)formatString;

@end
