//
//  UIView+Animation.h
//  职通车
//
//  Created by PengZK on 2018/1/23.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)<CAAnimationDelegate>

/**
 显示出现时放大动画
 */
- (void)showZoomInAnimation;

/**
 展示当前定位点的呼吸动画
 */
- (void)startBreatheAnimation;

/** 键盘弹出 */
- (void)showKeyboard:(CGFloat)marginTop;
/** 键盘退下 */
- (void)hidenKeyboard:(void (^)(BOOL finished))completion;

@end
