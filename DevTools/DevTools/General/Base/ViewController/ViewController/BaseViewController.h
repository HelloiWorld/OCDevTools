//
//  BaseViewController.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

///是否隐藏导航栏，默认为NO
@property (nonatomic, assign) BOOL hideNavBar;
///是否支持旋转，默认不支持
@property (nonatomic, assign) BOOL supportAutorotate;

//返回按钮点击后触发
- (void)handleReturnBtnPressed:(id)sender;

@end
