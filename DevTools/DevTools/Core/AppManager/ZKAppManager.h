//
//  ZKAppManager.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define AppMan [ZTCAppMan sharedInstance]
#define ZTC_Navi [[ZTCAppMan sharedInstance] globalNaviContoller]
#define ZTC_Tab  [[ZTCAppMan sharedInstance] globalTabbarController]

#define ZTC_WriteGlobalObj(__obj, __key) ([AppMan setGlobalObject: __obj forKey: __key])
#define ZTC_GlobalObjForKey(__key) [AppMan globalObjectForKey: __key]
#define ZTC_RemoveGlobalObjForKey(__key)  [AppMan removeGlobalObjectForKey: __key]
#define ZTC_RemoveAllGlobalObjs  [AppMan removeAllGlobalObjects]

@interface ZKAppManager : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (UINavigationController * _Nonnull)globalNaviContoller;

- (UITabBarController * _Nonnull)globalTabbarController;

- (UINavigationController * _Nonnull)globalRegisterNavigation;

#pragma mark - 全局数据写入内存

/**
 全局轻量级数据存储接口，用于全局轻量级数据交换
 
 @param obj 待交换的临时数据对象
 @param key 键名
 */
- (void)setGlobalObject:(id _Nonnull)obj forKey:(NSString *_Nonnull)key;

/**
 全局轻量级数据读取接口，用于全局轻量级数据交换
 
 @param key 键名
 @return 键名对应的临时数据
 */
- (id _Nullable)globalObjectForKey:(NSString *_Nonnull)key;

/**
 清除临时存储数据对象
 
 @param key 存储数据对应的键名
 */
- (void)removeGlobalObjectForKey:(NSString *_Nonnull)key;

///清除所有临时存储数据对象
- (void)removeAllGlobalObjects;

@end
