//
//  LimitTextView.m
//  DevTools
//
//  Created by PengZK on 2018/3/13.
//  Copyright © 2018年 None. All rights reserved.
//

#import "LimitTextView.h"
#import "UITextView+LineSpace.h"
#import "CommonThemeMacro.h"

@implementation LimitTextView

#pragma mark - Init
// 手写代码调用的代码
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupAttributes];
    }
    return self;
}
// Storyboard/XIB会调用的方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupAttributes];
    }
    return self;
}

- (void)setupAttributes {
    self.delegate = self;
    _limitLength = 100;
    _placeHolderText = @"";
    _placeHolderTextColor = kUIColorFromRGB(0xACACAC);
    _inputTextColor = kUIColorFromRGB(0x505050);
}

#pragma mark - Public Method
- (void)attributedStringWithText:(NSString*)text{
    // textview 改变字体的行间距
    UIColor *attributedColor;
    if ([text isEqualToString:_placeHolderText]) {
        attributedColor = _placeHolderTextColor;
    } else {
        attributedColor = _inputTextColor;
    }
    [self setText:text foregroundColor:attributedColor lineSpacing:6];
}

#pragma mark - TextView Delegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSString *text = textView.text;
    if ([text isEqualToString:_placeHolderText]) {
        text = @"";
    }
    [self attributedStringWithText:text];
    if ([self.textDelegate respondsToSelector:@selector(updateLimitNumLabel)]) {
        [self.textDelegate updateLimitNumLabel];
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > _limitLength) {
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        NSString *s = [nsTextContent substringToIndex:_limitLength];
        [textView setText:s];
    }
    
    [self attributedStringWithText:textView.text];
    if ([self.textDelegate respondsToSelector:@selector(updateLimitNumLabel)]) {
        [self.textDelegate updateLimitNumLabel];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //获取高亮部分内容
    //NSString * selectedtext = [textView textInRange:selectedRange];
    
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        
        if (offsetRange.location < _limitLength) {
            return YES;
        }
        else {
            return NO;
        }
    }
    
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    NSInteger caninputlen = _limitLength - comcatstr.length;
    
    if (caninputlen >= 0) {
        return YES;
    }
    else {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        
        if (rg.length > 0) {
            NSString *s = @"";
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL asc = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (asc) {
                s = [text substringWithRange:rg];//因为是ascii码直接取就可以了不会错
            }
            else {
                __block NSInteger idx = 0;
                __block NSString  *trimString = @"";//截取出的字串
                //使用字符串遍历，这个方法能准确知道每个emoji是占一个unicode还是两个
                [text enumerateSubstringsInRange:NSMakeRange(0, [text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                          
                                          if (idx >= rg.length) {
                                              *stop = YES; //取出所需要就break，提高效率
                                              return ;
                                          }
                                          
                                          trimString = [trimString stringByAppendingString:substring];
                                          
                                          idx++;
                                      }];
                
                s = trimString;
            }
            //rang是指从当前光标处进行替换处理(注意如果执行此句后面返回的是YES会触发didchange事件)
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
            return YES;
        }
        return NO;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        [self attributedStringWithText:_placeHolderText];
        if ([self.textDelegate respondsToSelector:@selector(updateLimitNumLabel)]) {
            [self.textDelegate updateLimitNumLabel];
        }
    }
}

@end
