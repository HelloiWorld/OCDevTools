//
//  NSArray+Search.h
//  职通车
//
//  Created by PengZK on 2017/8/29.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Search)

/**
 *  默认搜索
 *
 *  @param fieldArray  搜索字段数组
 *  @param inputString 输入文字
 *  @param array       搜索数据源
 *
 *  @return 搜索结果
 */
+ (NSArray *)searchWithFieldArray:(NSArray *)fieldArray
                      inputString:(NSString *)inputString
                          inArray:(NSArray *)array;

@end
