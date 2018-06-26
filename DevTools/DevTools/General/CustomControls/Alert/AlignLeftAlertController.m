//
//  AlignLeftAlertController.m
//  职通车
//
//  Created by PengZK on 2017/10/16.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "AlignLeftAlertController.h"

@interface AlignLeftAlertController ()

@end

@implementation AlignLeftAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    AlignLeftAlertController *alert = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIView *subView1 = [alert.view.subviews firstObject];
    UIView *subView2 = [subView1.subviews firstObject];
    UIView *subView3 = [subView2.subviews firstObject];
    UIView *subView4 = [subView3.subviews firstObject];
    UIView *subView5 = [subView4.subviews firstObject];
//    NSLog(@"%@",subView5.subviews);
    //取title和message：
//    if (subView5.subviews.count > 0) {
//        UILabel *titleLabel = subView5.subviews[0];
//        titleLabel.textAlignment = NSTextAlignmentLeft;
//    }
    if (subView5.subviews.count > 1) {
        UILabel *messageLabel = subView5.subviews[1];
        //比如设置message内容居左：
        if (messageLabel && [messageLabel isKindOfClass:[UILabel class]]) {
            messageLabel.textAlignment = NSTextAlignmentLeft;
        }
    }
    
    return alert;
}

@end
