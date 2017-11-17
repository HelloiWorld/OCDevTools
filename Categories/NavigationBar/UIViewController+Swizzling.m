//
//  UIViewController+Swizzling.m
//  utils
//
//  Created by PengZK on 2017/11/17.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import "SwizzlingDefine.h"

#pragma mark - UIColor宏定义
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)

@implementation UIViewController (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([UIViewController class] ,@selector(viewDidLoad),    @selector(swizzling_viewDidLoad));
    });
}

#pragma mark - ViewDidLoad
- (void)swizzling_viewDidLoad{
    if (self.navigationController) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
        UIImage *backArrowImage = [[UIImage imageNamed:@"返回"] imageWithAlignmentRectInsets:insets];
        //        UIImage *buttonNormal = [[UIImage imageNamed:@"返回.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.navigationController.navigationBar setBackIndicatorImage:backArrowImage];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:backArrowImage];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backItem;
        
        // 设置返回按钮图标颜色
        UIColor *titleColor = [UIColor colorWithRed:(34/255.0) green:(34/255.0)  blue:(34/255.0) alpha:0.7];
        self.navigationController.navigationBar.tintColor = titleColor;
        // 设置中间文本字体
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:self.navigationController.navigationBar.titleTextAttributes];
        [dic setObject:[UIFont boldSystemFontOfSize:17] forKey:NSFontAttributeName];
        [dic setObject:UIColorFromRGB(0x505050) forKey:NSForegroundColorAttributeName];
        self.navigationController.navigationBar.titleTextAttributes = [dic copy];
        
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[self imageWithColor:UIColorFromRGB(0xEEEEEE)]];
        // 设置导航栏背景颜色
        //        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xffffff);
        //        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        // 去除毛玻璃效果,会导致状态栏与导航栏界面偏移
        //        self.navigationController.navigationBar.translucent = NO;
    }
    [self swizzling_viewDidLoad];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
