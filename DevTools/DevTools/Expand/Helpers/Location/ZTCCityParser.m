//
//  ZTCCityParser.m
//  职通车
//
//  Created by PengZK on 2018/3/15.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import "ZTCCityParser.h"

@interface ZTCCityParser()

@property (nonatomic, copy) NSArray *cityArray;

@end

#define NameKey @"name"
#define IDKey @"id"
#define CityKey @"cities"
#define DistrictKey @"districts"

@implementation ZTCCityParser

static ZTCCityParser *_instance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self loadCityJsonFile];
    }
    return self;
}

- (void)loadCityJsonFile{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"districts" withExtension:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfURL: fileURL];
    NSError *err = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: jsonData options:NSJSONReadingAllowFragments error: &err];
    self.cityArray = jsonArray;
}

#pragma mark - Public Method

- (NSArray *)allLevel1AreaName{
    NSMutableArray *retArray = [NSMutableArray arrayWithCapacity: 34];
    for (NSDictionary *area in _cityArray) {
        NSString *name = [area objectForKey: NameKey];
        [retArray addObject: name];
    }
    return [NSArray arrayWithArray: retArray];
}

- (NSArray *)level2AreaNameWithLeve1:(NSString *)level1Name{
    NSArray *retArray = nil;
    for (NSDictionary *area in _cityArray) {
        NSString *name = [area objectForKey: NameKey];
        if ([name isEqualToString: level1Name]) {
            NSArray *cityInfoArray = [area objectForKey: CityKey];
            NSMutableArray *cityNameArray = [NSMutableArray array];
            for (NSDictionary *cityInfo in cityInfoArray) {
                [cityNameArray addObject: cityInfo[NameKey]];
            }
            retArray = cityNameArray;
            break;
        }
    }
    return retArray;
}

- (NSArray *)level3AreaNameWithLeve2:(NSString *)level2Name Level1:(NSString *)level1Name{
    if (level2Name.length == 0) return nil;
    
    NSArray *retArray = nil;
    for (NSDictionary *area in _cityArray) {
        NSString *name = [area objectForKey: NameKey];
        if ([name isEqualToString: level1Name]) {
            NSArray *cityInfoArray = [area objectForKey: CityKey];
            for (NSDictionary *cityInfo in cityInfoArray) {
                if ([cityInfo[NameKey] isEqualToString:level2Name]) {
                    NSArray *districtInfoArray = [cityInfo objectForKey: DistrictKey];
                    NSMutableArray *districtNameArray = [NSMutableArray array];
                    for (NSDictionary *districtInfo in districtInfoArray) {
                        [districtNameArray addObject: districtInfo[NameKey]];
                    }
                    retArray = districtNameArray;
                    return retArray;
                }
            }
        }
    }
    return retArray;
}

- (int)areaIDWithName:(NSString *)areaName{
    int retID = -1;
    for (NSDictionary *level1Area in _cityArray) {
        //先遍历一级行政区域
        NSString *level1Name = level1Area[NameKey];
        if ([level1Name isEqualToString: areaName]) {
            retID = [level1Area[IDKey] intValue];
            break;
        }else{
            //遍历每个1级行政区域下的二级区域
            NSArray *cityArray = level1Area[CityKey];
            for (NSDictionary *level2Area in cityArray) {
                NSString *cityName = level2Area[NameKey];
                if ([cityName isEqualToString: areaName]) {
                    retID = [level2Area[IDKey] intValue];
                    return retID;
                }else{
                    //遍历每个2级行政区域下的三级区域
                    NSArray *districtArray = level2Area[DistrictKey];
                    for (NSDictionary *level3Area in districtArray) {
                        NSString *districtName = level3Area[NameKey];
                        if ([districtName isEqualToString: areaName]) {
                            retID = [level3Area[IDKey] intValue];
                            return retID;
                        }
                    }
                }
            }
        }
    }
    return retID;
}

- (NSString *)areaNameWithID:(int)areaID{
    NSString *retName = nil;
    for (NSDictionary *level1Area in _cityArray) {
        //先遍历一级行政区域
        int level1_id = [level1Area[IDKey] intValue];
        if (level1_id == areaID) {
            retName = level1Area[NameKey];
            break;
        }else{
            //遍历每个1级行政区域下的二级区域
            NSArray *cityArray = level1Area[CityKey];
            for (NSDictionary *level2Area in cityArray) {
                int cityID = [level2Area[IDKey] intValue];
                if (cityID == areaID) {
                    retName = level2Area[NameKey];
                    return retName;
                }else{
                    //遍历每个2级行政区域下的三级区域
                    NSArray *districtArray = level2Area[CityKey];
                    for (NSDictionary *level3Area in districtArray) {
                        int districtID = [level3Area[IDKey] intValue];
                        if (districtID == areaID) {
                            retName = level3Area[NameKey];
                            return retName;
                        }
                    }
                }
            }
        }
    }
    return retName;
}

@end
