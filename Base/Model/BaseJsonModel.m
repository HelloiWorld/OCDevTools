//
//  BaseJsonModel.m
//  Tools
//
//  Created by PengZK on 2017/11/22.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "BaseJsonModel.h"

@implementation BaseJsonModel

- (instancetype)initWithDictionary:(NSDictionary *)jsonDic{
    self = [super init];
    Class selfClass = [self class];
    if (self) {
        NSDictionary *keyMap = [selfClass localServerKeyMap];
        Class nsNullClass = [NSNull class];
        [keyMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSString *jsonKey = (NSString *)obj;
            NSString *objKey = (NSString *)key;
            id jsonObj = [jsonDic objectForKey: jsonKey];
            if (jsonObj == nil || [jsonObj isKindOfClass: nsNullClass]) {
                return;
            }
            [self setValue: jsonObj forKey: objKey];
        }];
    }
    
    return self;
    
}

- (NSDictionary *)jsonDictionary{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithCapacity: 11];
    Class selfClass = [self class];
    NSDictionary *keyMap = [selfClass localServerKeyMap];
    [keyMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *objKey = (NSString *)key;
        NSString *jsonKey = (NSString *)obj;
        id jsonObj = [self valueForKey: objKey];
        if (jsonObj) {
            [paramsDic setObject: jsonObj forKey: jsonKey];
        }
    }];
    
    return [NSDictionary dictionaryWithDictionary: paramsDic];
}

/**
 本地modelClass 与 服务端报文 键名映射关系表
 
 @return 键名映射关系表, 子类覆盖这个方法
 */
+ (NSDictionary *)localServerKeyMap{
    return @{};
}

@end
