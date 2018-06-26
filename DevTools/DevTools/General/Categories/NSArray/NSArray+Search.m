//
//  NSArray+Search.m
//  职通车
//
//  Created by PengZK on 2017/8/29.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "NSArray+Search.h"

@implementation NSArray (Search)

+ (NSArray *)searchWithFieldArray:(NSArray *)fieldArray
                      inputString:(NSString *)inputString
                          inArray:(NSArray *)array
{
    if (![array count] || ![fieldArray count]) {
        return nil;
    }
    
    NSPredicate *scopePredicate;
    NSMutableArray *backArray = [NSMutableArray array];
    
    for (NSString *fieldString in fieldArray) {
        scopePredicate = [NSPredicate predicateWithFormat:@"SELF.%@ contains[c] %@", fieldString, inputString];
        NSArray *tempArray = [array filteredArrayUsingPredicate:scopePredicate];
        for (NSObject *object in tempArray) {
            if (![backArray containsObject:object]) {
                [backArray addObject:object];
            }
        }
    }
    NSLog(@"searchArray: %@", backArray);
    return backArray;
}

@end
