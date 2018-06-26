//
//  UIScrollView+Direction.h
//  Tools
//
//  Created by PengZK on 2017/11/20.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ScrollViewDirection) {
    ScrollViewDirectionNone,
    ScrollViewDirectionRight,
    ScrollViewDirectionLeft,
    ScrollViewDirectionUp,
    ScrollViewDirectionDown,
};

@interface UIScrollView (Direction)

- (void)startObservingDirection;
/// you'd better call this method when dealloc
- (void)stopObservingDirection;

@property (nonatomic, readonly) ScrollViewDirection horizontalScrollingDirection;
@property (nonatomic, readonly) ScrollViewDirection verticalScrollingDirection;

@end
