//
//  UILabel+LineSpace.h
//  职通车
//
//  Created by Yangtsing.Zhang on 2017/6/21.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LineSpace)

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

///加首行缩进
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing firstLineIndentation: (CGFloat)firstLineOffset;

+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

@end
