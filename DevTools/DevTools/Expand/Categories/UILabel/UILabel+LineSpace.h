//
//  UILabel+LineSpace.h
//  职通车
//
//  Created by PZK on 2017/7/21.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LineSpace)

/**
 设置文本行间距
 
 @param text 显示文本
 @param lineSpacing 行距
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;


/**
 设置文本行间距和首行缩进
 
 @param text 显示文本
 @param lineSpacing 行距
 @param firstLineOffset 首行缩进
 */
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing firstLineIndentation: (CGFloat)firstLineOffset;


/**
 计算富文本行高
 
 @param text 显示文本
 @param fontSize 字体大小
 @param width 文本展示宽度
 @param lineSpacing 行距
 @return 实际高度
 */
+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

@end
