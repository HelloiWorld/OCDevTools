//
//  BaseJsonModel.h
//  Tools
//  小巧，轻量级的Json模型
//  用于 本地Model<-->服务端Json 快速互转
//  根据后端业务请求返回数据格式，自行子类化该类
//  实现 + (NSDictionary *)localServerKeyMap 方法即可
//
//  Created by PengZK on 2017/11/22.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseJsonModel : NSObject

/**
 用服务端返回的Json报文初始化一个OC数据模型 实例
 
 @param jsonDic 来自服务端的json报文
 @return 初始化的model 实例
 */
- (instancetype)initWithDictionary: (NSDictionary *)jsonDic;

/**
 返回1个描述该Model实例的字典，注意: 属性为nil的不会被加入字典
 这就意味着，如果想要往服务端传空串，一定要赋值上@""
 
 @return 该model实例的描述字典
 */
- (NSDictionary *)jsonDictionary;

/**
 本地与服务端对应字段匹配

 @return 匹配的字典信息
 */
+ (NSDictionary *)localServerKeyMap;

@end
