//
//  UINavigationBar+Swizzling.m
//  Tools
//
//  Created by PengZK on 2017/11/17.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "UINavigationBar+Swizzling.h"
#import "SwizzlingDefine.h"
#import "UIViewAdditions.h"
#import "UIView+Responder.h"

@implementation UINavigationBar (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([UINavigationBar class] ,@selector(layoutSubviews), @selector(swizzling_layoutSubviews));
    });
}

#pragma mark - LayoutSubviews
#define NavigationBtnMargin 28
#define TitleMargin 43
- (void)swizzling_layoutSubviews{
    [self swizzling_layoutSubviews];
    
    UINavigationItem *navigationItem = [self topItem];
    UIView *subview  = [[navigationItem leftBarButtonItem] customView];
    subview.left = NavigationBtnMargin;
    
    //解决标题过长时，设置navigationItem.title导致标题偏移的问题
    UIView *view = navigationItem.titleView;
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel*)view;
        UIFont *font = self.titleTextAttributes[NSFontAttributeName];
        if (font) {
            label.font = font;
            [label sizeToFit];
        }
        UIColor *color = self.titleTextAttributes[NSForegroundColorAttributeName];
        if (color) {
            label.textColor = color;
        }
    }
    [self layoutLabel];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        UIViewController *vc = [self viewController];
        //在竖屏转横屏后，iOS7下导航条会变成32，但是并没有通知到对应vc...这里手动加一个... 否则排版会出问题
        [vc.view setNeedsLayout];
    }
}

#pragma mark - Private
- (void)layoutLabel{
    UINavigationItem *navigationItem = [self topItem];
    
    UIView *view = navigationItem.titleView;
    // iOS 11下，titleView会有一个superView : _UITAMICAdaptorView
    if ([view isKindOfClass:[UILabel class]]) {
        // Noop...
    } else if ([view isKindOfClass:[UIView class]]) {
#ifdef __IPHONE_11_0
        //这里写高版本xcode所具有的新的API
        //在高版本xcode运行,此部分的代码有颜色
        if (@available(iOS 11.0, *)) {
            view.centerX = [view superview].width * .5f;
            view.centerY = [view superview].height * .5f;
        } else {
            view.centerX = self.width  * .5f;
            view.centerY = self.height * .5f;
        }
#else
        //在低版本xcode运行,此本分代码为白色,也就是不会执行
        view.centerX = self.width  * .5f;
        view.centerY = self.height * .5f;
#endif
        
        // 自定义titleView,设置标题文字与左右两侧按钮最小间距
        UIView *leftView   = [[navigationItem leftBarButtonItems].lastObject customView];
        UIView *rightView  = [[navigationItem rightBarButtonItems].firstObject customView];
        CGFloat left  = leftView.right;
        CGFloat right = rightView ? rightView.left : self.width;
        CGFloat maxWidth   = right - left - 2 * TitleMargin;
        if (maxWidth > 0) {
            view.width   =  MIN(view.width, maxWidth);
        }
        
        for (UIView *subView in view.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                subView.centerX = view.width * .5f;
            }
        }
    }
}

@end
