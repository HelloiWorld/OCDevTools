//
//  UILayoutFittingView.m
//  职通车
//
//  Created by PengZK on 2017/10/10.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "UILayoutFittingView.h"

@implementation UILayoutFittingView

// Storyboard/XIB会调用的方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupContentView];
    }
    return self;
}
// 手写代码调用的代码
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView {

}

/// 解决iOS导航栏自定义titleView后 显示错误的问题（常用于搜索框）
- (CGSize)intrinsicContentSize {
//    return UILayoutFittingExpandedSize;
    return  CGSizeMake([UIScreen mainScreen].bounds.size.width - 2*43 - 2*20, 30);
}

@end
