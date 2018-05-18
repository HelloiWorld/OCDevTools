//
//  UIView+Sublayer.m
//  职通车
//
//  Created by PengZK on 2018/5/18.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import "UIView+Sublayer.h"

@implementation UIView (Sublayer)

- (void)drawDashLayerWithLineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength lineSpacing:(CGFloat)lineSpacing strokeColor:(UIColor*)strokeColor cornerRadius:(CGFloat)radius{
//    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)]; // 一句话清除所有子图层，不足是也会将subView也一并清除掉
    // 如果view的大小尚未确定，需先强制刷新
    [self layoutIfNeeded];
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = self.bounds;//虚线框的大小
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));//虚线框锚点
    borderLayer.fillColor = [UIColor clearColor].CGColor;//填充色
    borderLayer.strokeColor = strokeColor.CGColor;//画笔颜色
    borderLayer.lineWidth = lineWidth;//虚线宽度
    //虚线边框
    borderLayer.lineDashPattern = @[@(lineLength), @(lineSpacing)];
    //实线边框
//    borderLayer.lineDashPattern = nil;
    
//    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:radius].CGPath;//矩形路径
    
    [self.layer addSublayer:borderLayer];
}

- (void)drawGradientLayerWithColors:(NSArray*)colors locations:(NSArray<NSNumber*>*)locations{
    // 一句话清除所有子图层
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    CAGradientLayer *degreeGradientLayer = [CAGradientLayer layer];
    degreeGradientLayer.colors = colors;
    degreeGradientLayer.locations = locations;
    degreeGradientLayer.startPoint = CGPointMake(0, 0);
    degreeGradientLayer.endPoint = CGPointMake(1.0, 0);
    degreeGradientLayer.frame = self.bounds;
    
    [self.layer addSublayer:degreeGradientLayer];
}

@end
