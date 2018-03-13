//
//  LimitTextField.h
//  DevTools
//
//  Created by PengZK on 2018/3/13.
//  Copyright © 2018年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NUMBERS @"0123456789"   // 纯数字
#define PhoneNum @"0123456789-" // 手机号和电话号码

@protocol LimitTextFieldDelegate <NSObject>
// 用于监听文字改变事件，例如统计文本字符总数
- (void)textFieldTextDidChange;
@end

@interface LimitTextField : UITextField

@property (nonatomic, weak) id<LimitTextFieldDelegate> textDelegate;

///限制的字数
@property (nonatomic, assign) NSUInteger limitLength;
///限制的字符
@property (nonatomic, copy) NSString *limitString;

@end
