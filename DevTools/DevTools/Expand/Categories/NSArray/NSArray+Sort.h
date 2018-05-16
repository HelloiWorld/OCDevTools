//
//  NSArray+Sort.h
//  职通车
//
//  Created by PengZK on 2017/8/14.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sort)

/**
 单键排序

 @param key 传入键值
 @param isAscending 升/降序
 @return 排序后的数组
 */
- (NSArray*)sortWithKey:(NSString*)key isAscending:(BOOL)isAscending;


/**
 多键排序

 @param keys 传入键值数组
 @param isAscending 升/降序
 @return 排序后的数组
 */
- (NSArray*)sortWithKeys:(NSArray<NSString*>*)keys isAscending:(BOOL)isAscending;

@end
