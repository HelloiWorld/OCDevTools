//
//  UIImage+Blur.h
//  职通车
//
//  Created by PengZK on 2018/3/8.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Blur)

#pragma mark 高斯模糊
//CoreImage
+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
//vImage
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
