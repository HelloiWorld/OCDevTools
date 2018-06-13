//
//  ZTCCityParser.h
//  职通车
//
//  Created by PengZK on 2018/3/15.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZTCCityParser_Instance [ZTCCityParser sharedInstance]

@interface ZTCCityParser : NSObject

+ (instancetype)sharedInstance;

/**
 返回所有的一级行政区域名字(省，直辖市，特别行政区)
 
 @return 一级行政区域名字数组
 */
- (NSArray *)allLevel1AreaName;


/**
 返回一级行政区域下的二级行政区域名字，即城市
 
 @param level1Name 一级行政区域名字
 @return 该一级行政区域对应下的二级行政区域数组
 */
- (NSArray *)level2AreaNameWithLeve1:(NSString *_Nonnull)level1Name;

/**
 返回二级行政区域下的三级行政区域名字，即区/县
 
 @param level2Name 二级行政区域名字
 @param level1Name 一级行政区域名字
 @return 该二级行政区域对应下的三级行政区域数组
 */
- (NSArray *)level3AreaNameWithLeve2:(NSString *)level2Name Level1:(NSString *)level1Name;

/**
 区域name转区域ID
 
 @param areaName 区域名字，例如 ‘北京’
 @return areaID  区域编码，例如 110100
 */
- (int)areaIDWithName: (NSString *)areaName;


/**
 区域ID转区域name
 
 @param areaID 区域编码，例如 110100
 @return areaName 区域名字，例如 ‘北京’
 */
- (NSString *)areaNameWithID: (int)areaID;

@end
