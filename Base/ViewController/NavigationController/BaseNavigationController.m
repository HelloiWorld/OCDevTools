//
//  BaseNavigationController.m
//  Tools
//
//  Created by PengZK on 2017/11/22.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 重写pushViewController:animated:跳转方法
 1. 自动隐藏tabBar
 2. 解决iPhone X跳转时tabBar上移的问题
 
 @param viewController viewController
 @param animated animated
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}

#pragma roate method
- (BOOL)shouldAutorotate
{
    return _shouldRotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return _shouldRotate ? UIInterfaceOrientationMaskAllButUpsideDown : UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (_shouldRotate) {
        return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
                interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
                interfaceOrientation == UIInterfaceOrientationPortrait);
    }
    return UIInterfaceOrientationPortrait == interfaceOrientation;
}

@end
