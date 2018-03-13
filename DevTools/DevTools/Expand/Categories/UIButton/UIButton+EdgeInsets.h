//
//  UIButton+EdgeInsets.h
//  Tools
//
//  Created by PengZK on 2018/1/5.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EdgeInsets)

/**
 图片上，文字下
 
 @param spacing 间距
 */
- (void)verticalImageAndTitle:(CGFloat)spacing;

/**
 图片右，文字左
 
 @param spacing 间距
 */
- (void)reverseImageAndTitle:(CGFloat)spacing;

@end
