//
//  LimitTextField.m
//  DevTools
//
//  Created by PengZK on 2018/3/13.
//  Copyright © 2018年 None. All rights reserved.
//

#import "LimitTextField.h"

@implementation LimitTextField

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

#pragma mark - Setter
- (void)setupAttributes {
    _limitLength = 10;
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - 监听
- (void)textFieldDidChange:(UITextField *)textField
{
    // 限制输入字符
    if (_limitString) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:_limitString] invertedSet];
        NSString *filteredString = [[textField.text componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [textField.text isEqualToString:filteredString];
        // 过滤后的文本与过滤前不相同 则表示包含不合法字符串
        if (!basicTest) {
            textField.text = filteredString;
        }
    }
    
    NSUInteger length = _limitLength;
    NSString *toBeString = textField.text;
    
    UITextRange *selectedRange = [textField markedTextRange];       //获取高亮部分
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position || !selectedRange)
    {
        if (toBeString.length > length)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:length];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:length];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, length)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
    
    //    NSString *lang = [[textField textInputMode] primaryLanguage]; // 键盘输入模式
    //    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
    //
    //    }
    //    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    //    else {
    //
    //    }
    if ([self.textDelegate respondsToSelector:@selector(textFieldTextDidChange)]) {
        [self.textDelegate textFieldTextDidChange];
    }
}

@end
