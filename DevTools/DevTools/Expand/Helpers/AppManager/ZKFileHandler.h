//
//  ZKFileHandler.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const NSUserDefaultsKey_isFirstBoot = @"isFirstBoot"; //是否第一次启动
static NSString * const NSUserDefaultsKey_deviceToken = @"deviceToken"; //用户同意接收推送通知获取到的deviceToken

@interface ZKFileHandler : NSObject

#pragma mark - 写入NSUserDefaults

/**
 保存对象到UserDefaults
 
 @param object 待存对象
 @param key key
 */
+ (void)setObjectToUserDefaults:(id)object forKey:(NSString *)key;

/**
 从UserDefaults获取对象
 
 @param key key
 @return 对象字符串
 */
+ (NSString*)objectFromUserDefaultsForKey:(NSString *)key;
/**
 从UserDefaults获取对象
 
 @param key key
 @return bool值
 */
+ (BOOL)boolFromUserDefaultsForKey:(NSString *)key;

/**
 从UserDefaults移除Object
 
 @param key key
 */
+ (void)removeObjectFromUserDefaultsForKey:(NSString *)key;

@end
