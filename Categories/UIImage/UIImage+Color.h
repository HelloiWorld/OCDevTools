//
//  UIImage+Color.h
//  职通车
//
//  Created by pzk on 2017/8/4.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 根据颜色生成图片

 @param color 指定背景颜色
 @return UIImage实例
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
