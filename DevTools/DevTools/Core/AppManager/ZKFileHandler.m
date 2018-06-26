//
//  ZKFileHandler.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "ZKFileHandler.h"

@implementation ZKFileHandler

#pragma mark - UserDefaults Method

+ (void)setObjectToUserDefaults:(id)object forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];
}

+ (NSString*)objectFromUserDefaultsForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *objectString = [defaults objectForKey:key];
    return objectString;
}

+ (BOOL)boolFromUserDefaultsForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL object = [defaults boolForKey:key];
    return object;
}

+ (void)removeObjectFromUserDefaultsForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

@end
