//
//  LimitTextView.h
//  DevTools
//
//  Created by PengZK on 2018/3/13.
//  Copyright © 2018年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LimitTextViewDelegate <NSObject>
// 用于监听文字改变事件，例如统计文本字符总数
- (void)updateLimitNumLabel;
@end

/*
 使用须知：
 一定要在storyboard/xib中将delegate的连线移除，或者将代理指向此类对象，否则这里的代理事件不会触发
 */
@interface LimitTextView : UITextView<UITextViewDelegate>

@property (nonatomic, weak) id<LimitTextViewDelegate> textDelegate;

///限制的字数
@property (nonatomic, assign) NSUInteger limitLength;
///默认提示文字
@property (nonatomic, copy) NSString *placeHolderText;
///默认提示文字颜色
@property (nonatomic, strong) UIColor *placeHolderTextColor;
///输入文字颜色文字
@property (nonatomic, strong) UIColor *inputTextColor;

//由于有时初始化的时候传入了固定文本，此时需要调用此方法对其进行处理
- (void)attributedStringWithText:(NSString*)text;

@end
