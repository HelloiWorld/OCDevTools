//
//  ZKConfig.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define APP_TEST_PRD 0  //  提交给测试人员前打开此宏,开发阶段不允许打开
typedef NS_ENUM(NSUInteger, API_TYPE) {
    API_TYPE_DEV,   //开发模式    //只用于本地测试，通常不适用
    API_TYPE_STG,   //线上测试环境 //用于和服务端联调
    API_TYPE_PRD,   //生产环境
};

#define APP_CONFIG [ZTConfig instance]

@interface ZKConfig : NSObject

// App Id
@property (nonatomic, copy) NSString *appId;

// Client name.
@property (nonatomic, copy) NSString *clientName;

// app名称比如''
@property (nonatomic, copy) NSString *appName;

// Client version
@property (nonatomic, copy) NSString *version;

///服务端API版本
@property (nonatomic, copy) NSString *apiVersion;

//云存储服务地址
@property (nonatomic, copy) NSString *cdnHost;

//服务器前缀
@property (nonatomic, copy) NSString *apiHost; //远程接口host

@property (nonatomic, assign, readonly) API_TYPE apiType; //开发环境: 0  测试环境: 1 生产环境: 2

@property (nonatomic, copy) NSString *channelId; //渠道号

// 云信key
@property (nonatomic, copy) NSString *netEaseIMAppKey;
// 云信name
@property (nonatomic, copy) NSString *netEaseIMApnsName;

//接口加密秘钥 使用此秘钥加密隐私字段 需要客户端自己生成随机数传给服务端
@property (nonatomic, copy , readonly) NSString *apiEncodeKey;

//公钥
@property (nonatomic, copy) NSString *publicKey;

+ (ZKConfig *)instance;

@end
