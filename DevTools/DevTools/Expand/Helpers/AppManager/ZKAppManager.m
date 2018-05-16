//
//  ZKAppManager.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "ZKAppManager.h"
#import "AppDelegate.h"

@implementation ZKAppManager

static ZKAppManager *_instance = nil;
static NSMutableDictionary *_globalDic = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

#pragma mark - Getters

- (UINavigationController *)globalNaviContoller
{
    UITabBarController *tabVC = [self globalTabbarController];
    UINavigationController *subNavi = tabVC.selectedViewController;
    return subNavi;
}

- (UITabBarController *)globalTabbarController
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UITabBarController *tabVC = (UITabBarController *)delegate.window.rootViewController;
    return tabVC;
}

- (UINavigationController *)globalRegisterNavigation
{
    UIStoryboard *loginStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *loginVC = [loginStoryBoard instantiateInitialViewController];
    return loginVC;
}

- (void)setGlobalObject:(id)obj forKey:(NSString *)key{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _globalDic = [NSMutableDictionary dictionary];
    });
    [_globalDic setObject: obj forKey: key];
}

- (id)globalObjectForKey:(NSString *)key{
    id obj = [_globalDic objectForKey: key];
    return obj;
}

- (void)removeGlobalObjectForKey:(NSString *)key{
    [_globalDic removeObjectForKey: key];
}

- (void)removeAllGlobalObjects{
    [_globalDic removeAllObjects];
}

@end
