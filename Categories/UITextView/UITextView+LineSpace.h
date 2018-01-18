//
//  UITextView+LineSpace.h
//  职通车
//
//  Created by PengZK on 2018/1/18.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LineSpace)

/**
 设置文本行间距
 
 @param text 显示文本
 @param lineSpacing 行距
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

/**
 设置文本行间距
 
 @param text 显示文本
 @param color 文字颜色
 @param lineSpacing 行距
 */
- (void)setText:(NSString*)text foregroundColor:(UIColor*)color lineSpacing:(CGFloat)lineSpacing;


/**
 计算富文本行高

 @param text 显示文本
 @param fontSize 字体大小
 @param width 文本展示宽度，由于UITextView有inset，所以有一点不同
 @param lineSpacing 行距
 @return 实际高度
 */
+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

@end
