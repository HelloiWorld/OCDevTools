//
//  UIView+Responder.h
//  职通车
//
//  Created by PengZK on 2017/8/1.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Responder)

/// 根据view获取对应的VC
- (UIViewController *)nextResponderOfVC;
//找到自己的vc
- (UIViewController *)viewController;

@end
