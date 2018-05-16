//
//  NSArray+Sort.m
//  职通车
//
//  Created by PengZK on 2017/8/14.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)

#pragma mark -- 数组排序方法（升序/降序）

- (void)sortWithAscending:(BOOL)isAscending{
    //数组排序
    //定义一个数字数组
    NSArray *array = self;
    //对数组进行排序
    NSArray *result = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if (isAscending) {
            return [obj1 compare:obj2]; //升序
        } else {
            return [obj2 compare:obj1]; //降序
        }
    }];
    
    //通过自带的compare方法升序排列
//    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"5",@"1",@"4",@"2",nil];
//    [array sortUsingSelector:@selector(compare:)];
//    //通过倒序的方法进行降序排列
//    NSEnumerator *enumerator = [array reverseObjectEnumerator];
//    array =[[NSMutableArray alloc]initWithArray: [enumerator allObjects]];
    
    NSLog(@"result = %@",result);
}

- (NSArray*)sortWithKey:(NSString*)key isAscending:(BOOL)isAscending {
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:isAscending];
    //这个数组保存的是排序好的对象,有返回值
    NSArray *tempArray = [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    // 下面是可变数组的方法,无返回值
    //    [array sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    return tempArray;
}

- (NSArray*)sortWithKeys:(NSArray<NSString*>*)keys isAscending:(BOOL)isAscending {
    
    NSMutableArray *sortDescriptors = [NSMutableArray array];
    
    for (NSString *key in keys) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:isAscending];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    NSArray *tempArray = [self sortedArrayUsingDescriptors:sortDescriptors];
    
    return tempArray;
}

@end
