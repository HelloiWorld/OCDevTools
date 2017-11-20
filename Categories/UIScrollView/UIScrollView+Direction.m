//
//  UIScrollView+Direction.m
//  Tools
//
//  Created by PengZK on 2017/11/20.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "UIScrollView+Direction.h"
#import <objc/runtime.h>

@interface UIScrollView ()
@property (nonatomic, assign) ScrollViewDirection horizontalScrollingDirection;
@property (nonatomic, assign) ScrollViewDirection verticalScrollingDirection;
@end

static const char horizontalScrollingDirectionKey;
static const char verticalScrollingDirectionKey;

@implementation UIScrollView (Direction)

- (void)startObservingDirection
{
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)stopObservingDirection
{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"]) return;
    
    CGPoint newContentOffset = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
    CGPoint oldContentOffset = [[change valueForKey:NSKeyValueChangeOldKey] CGPointValue];
    
    if (oldContentOffset.x < newContentOffset.x) {
        self.horizontalScrollingDirection = ScrollViewDirectionRight;
    } else if (oldContentOffset.x > newContentOffset.x) {
        self.horizontalScrollingDirection = ScrollViewDirectionLeft;
    } else {
        self.horizontalScrollingDirection = ScrollViewDirectionNone;
    }
    
    if (oldContentOffset.y < newContentOffset.y) {
        self.verticalScrollingDirection = ScrollViewDirectionDown;
    } else if (oldContentOffset.y > newContentOffset.y) {
        self.verticalScrollingDirection = ScrollViewDirectionUp;
    } else {
        self.verticalScrollingDirection = ScrollViewDirectionNone;
    }
}

#pragma mark - Properties

- (ScrollViewDirection)horizontalScrollingDirection
{
    return [objc_getAssociatedObject(self, (void *)&horizontalScrollingDirectionKey) intValue];
}

- (void)setHorizontalScrollingDirection:(ScrollViewDirection)horizontalScrollingDirection
{
    objc_setAssociatedObject(self, (void *)&horizontalScrollingDirectionKey, [NSNumber numberWithInt:horizontalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ScrollViewDirection)verticalScrollingDirection
{
    return [objc_getAssociatedObject(self, (void *)&verticalScrollingDirectionKey) intValue];
}

- (void)setVerticalScrollingDirection:(ScrollViewDirection)verticalScrollingDirection
{
    objc_setAssociatedObject(self, (void *)&verticalScrollingDirectionKey, [NSNumber numberWithInt:verticalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
