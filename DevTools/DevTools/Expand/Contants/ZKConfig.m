//
//  ZKConfig.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "ZKConfig.h"
#import "ZKVendorKeyConfig.h"

////////////////////////////////////////////////////
//  测试用服务端主机地址
////////////////////////////////////////////////////
#define API_TEST @"http://127.0.0.1:8080/"

////////////////////////////////////////////////////
//  开发用服务端主机地址
////////////////////////////////////////////////////
#define API_DEV @"http://127.0.0.1:8080/"

////////////////////////////////////////////////////
//  生产用服务端主机地址
////////////////////////////////////////////////////
#define API_PRODUCT @"https://"

////////////////////////////////////////////////////
//  开发用服务端API版本
////////////////////////////////////////////////////
#define API_DEV_VERSION @"api/v1/"

////////////////////////////////////////////////////
//  生产用服务端API版本
////////////////////////////////////////////////////
#define API_PRODUCT_VERSION @"api/v1/"

////////////////////////////////////////////////////
//  开发用CDN地址(七牛)
////////////////////////////////////////////////////
#define CDN_DEV_HOST @"http://"

////////////////////////////////////////////////////
//  生产用CDN地址(七牛)
////////////////////////////////////////////////////
#define CDN_PRODUCT_HOST @"https://"

/// APP渠道号
#define APP_CHANNEL_ID @""

@implementation ZKConfig

static ZKConfig *_instance = nil;
+ (ZKConfig *)instance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)init {
    if (self = [super init]) {
        [self initEnv];
    }
    return self;
}

#pragma mark - Setter
- (void)initEnv {
    
//    self.appId = @"";
//    self.clientName = @"";
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey];
    NSString *appName = [infoDictionary objectForKey:@"CFBundleName"];
    self.version = version;
    self.appName = appName;
    
#ifdef APP_TEST
    self.apiType = API_TYPE_STG;
#elif defined(DEBUG)
    self.apiType = API_TYPE_DEV;  //不容许改这个环境
#else
    self.apiType = API_TYPE_PRD;  //不容许改这个环境
#endif
    
}

- (void)setApiType:(NSInteger)apiType {
    _apiType = apiType;
    
    switch (_apiType) {
        case API_TYPE_DEV:
            self.apiHost = API_DEV;
            self.apiVersion = API_DEV_VERSION;
            self.cdnHost = CDN_DEV_HOST;
            break;
            
        case API_TYPE_STG:
            self.apiHost = API_TEST;
            self.apiVersion = API_DEV_VERSION;
            self.cdnHost = CDN_DEV_HOST;
            break;
            
        case API_TYPE_PRD:
            self.apiHost = API_PRODUCT;
            self.apiVersion = API_PRODUCT_VERSION;
            self.cdnHost = CDN_PRODUCT_HOST;
            break;
    }
}

#pragma mark - Getter
- (NSString *)apiHostWithApiType:(API_TYPE)apiType {
    switch (apiType) {
        case API_TYPE_DEV:
            return API_DEV;
            break;
        case API_TYPE_STG:
            return API_TEST;
            break;
        case API_TYPE_PRD:
            return API_PRODUCT;
            break;
    }
}

- (NSString *)channelId {
    return APP_CHANNEL_ID;
}

#pragma mark - Encrypt Logic
- (void)setPublicKey:(NSString *)publicKey {
    if (![_publicKey isEqualToString:publicKey]) {
        _publicKey = publicKey;
        [self generyApiEncodeKey];
    }
}

- (void)generyApiEncodeKey {
    _apiEncodeKey = [self randomString];
}

- (NSString *)randomString {
    NSInteger keyLength = 16;
    char data[keyLength];
    for (int x = 0;x < keyLength;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:keyLength encoding:NSUTF8StringEncoding];
}

@end
