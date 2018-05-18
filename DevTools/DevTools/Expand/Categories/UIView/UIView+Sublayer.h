//
//  UIView+Sublayer.h
//  职通车
//
//  Created by PengZK on 2018/5/18.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Sublayer)

/**
 添加虚线边框图层

 @param lineWidth 虚线宽度
 @param lineLength 虚线长度
 @param lineSpacing 虚线间隔
 @param strokeColor 画笔颜色
 @param radius 虚线弧度
 */
- (void)drawDashLayerWithLineWidth:(CGFloat)lineWidth
                        lineLength:(CGFloat)lineLength
                       lineSpacing:(CGFloat)lineSpacing
                       strokeColor:(UIColor*)strokeColor
                      cornerRadius:(CGFloat)radius;


/**
 添加渐变色图层

 @param colors 如@[(__bridge id)kCommon_main_color.CGColor, (__bridge id)UIColorFromRGB(0xf2f2f2).CGColor]
 @param locations 如@[@0.2, 0.5] 以数值所在点为中心发散
 */
- (void)drawGradientLayerWithColors:(NSArray*)colors
                          locations:(NSArray<NSNumber*>*)locations;

@end
