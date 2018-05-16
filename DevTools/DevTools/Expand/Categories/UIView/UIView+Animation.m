//
//  UIView+Animation.m
//  职通车
//
//  Created by PengZK on 2018/1/23.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

NSString *const kAnimationKeyZoomIn = @"AnimationKeyZoomIn";
NSString *const kAnimationKeyBreathe = @"AnimationKeyBreathe";

- (void)showZoomInAnimation {
    
    CABasicAnimation *forwardAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    forwardAnimation.duration = 0.3f;
    forwardAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5f :1.7f :0.6f :0.85f];
    forwardAnimation.fromValue = [NSNumber numberWithFloat:0.7f];
    forwardAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:forwardAnimation, nil];
//    animationGroup.delegate = self;
    animationGroup.duration = forwardAnimation.duration;
    animationGroup.removedOnCompletion = YES;
    //填充效果：动画结束后，动画将保持最后的表现状态
    animationGroup.fillMode = kCAFillModeForwards;
    
    [UIView animateWithDuration:animationGroup.duration
                          delay:0.0
                        options:0
                     animations:^{
                         [self.layer addAnimation:animationGroup forKey:kAnimationKeyZoomIn];
                     }
                     completion:^(BOOL finished) {
                     }];
}


- (void)startBreatheAnimation {
    // 缩放动画
    CABasicAnimation * scaleAnim = [CABasicAnimation animation];
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.fromValue = @1;
    scaleAnim.toValue = @1.1;
    scaleAnim.duration = 0.5;
    
    CABasicAnimation * scaleAnim2 = [CABasicAnimation animation];
    scaleAnim2.keyPath = @"transform.scale";
    scaleAnim2.fromValue = @1.1;
    scaleAnim2.toValue = @0.9;
    scaleAnim2.duration = 1.0;
    scaleAnim2.beginTime = scaleAnim.duration;
    
    CABasicAnimation * scaleAnim3 = [CABasicAnimation animation];
    scaleAnim3.keyPath = @"transform.scale";
    scaleAnim3.fromValue = @0.9;
    scaleAnim3.toValue = @1.0;
    scaleAnim3.duration = 0.5;
    scaleAnim3.beginTime = scaleAnim2.duration + scaleAnim2.beginTime;
    // 透明度动画
//    CABasicAnimation *opacityAnim=[CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnim.fromValue= @1;
//    opacityAnim.toValue= @0.2;
//    opacityAnim.duration= 2;
    // 创建动画组
    CAAnimationGroup *_groups =[CAAnimationGroup animation];
    _groups.animations = @[scaleAnim,scaleAnim2,scaleAnim3];
    _groups.removedOnCompletion = NO;
    _groups.fillMode = kCAFillModeForwards;
    _groups.duration = 2;
    _groups.repeatCount = FLT_MAX;
    
    [self.layer addAnimation:_groups forKey:kAnimationKeyBreathe];
}

/** 键盘弹出 */
- (void)showKeyboard:(CGFloat)marginTop
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, marginTop - self.frame.origin.y);
    } completion:^(BOOL finished) {
    }];
}

/** 键盘退下 */
- (void)hidenKeyboard:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:completion];
}

@end
