//
//  NSDate+Format.m
//  职通车
//
//  Created by PengZK on 2018/5/14.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

#pragma mark --时间 转 时间字符串
+ (NSString *)timeStringFromDate:(NSDate *)date formatString:(NSString *)formatString{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatString];
    NSString *timeStr = [formatter stringFromDate:date];
    return timeStr;
}

#pragma mark --时间字符串 转 时间
+ (NSDate *)dateFromTimeString:(NSString *)timeString formatString:(NSString *)formatString{
    if (timeString == nil || formatString == nil) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter dateFromString:timeString];
}

#pragma mark --时间戳 转 时间
+ (NSDate*)dateFromTimestamp:(long long)timeStamp{
    if (timeStamp == 0) {
        return nil;
    }
    //IOS 时间戳为10位数，服务器端为13位数(精确到了毫秒) 视需要可 / 1000
    return [NSDate dateWithTimeIntervalSince1970:timeStamp];
}

#pragma mark --时间字符串 转 时间戳
+ (long long)longLongFromDateString:(NSString*)dateStr formatString:(NSString *)formatString{
    if (dateStr == nil) {
        return 0.0;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateFormatter setDateFormat:formatString];
    NSDate* date = [dateFormatter dateFromString:dateStr];
    return [date timeIntervalSince1970];
}

#pragma mark --时间 转 时间戳
+ (long long)timesTampFromDate:(NSDate *)date{
    //IOS 时间戳为10位数，服务器端为13位数(精确到了毫秒) 视需要可 * 1000
    return [date timeIntervalSince1970];
}

#pragma mark --时间戳 转 时间字符串
+ (NSString *)timeStringFromTimestamp:(long long)timeStamp formatString:(NSString *)formatString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatString];
    //[formatter setTimeZone:[NSTimeZone systemTimeZone]];
    //[formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//指定时区-东8区
    //IOS 时间戳为10位数，服务器端为13位数(精确到了毫秒) 视需要可 / 1000
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp / 1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

@end
