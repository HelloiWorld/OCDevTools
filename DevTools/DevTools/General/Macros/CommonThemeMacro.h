//
//  CommonThemeMacro.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#ifndef CommonThemeMacro_h
#define CommonThemeMacro_h

#import "UIColor-Adaptive.h"
//便利宏
#define UIColorWithHexString(__hex) [UIColor colorWithHexString: __hex]

#pragma mark - UIColor宏定义
// 十六进制颜色宏
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kUIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

/*===============Color begin===============*/

// 主色(浅绿色)
#define kCommon_main_color                    UIColorWithHexString(@"39cb8a")
// 背景色
#define kCommon_window_color                  UIColorWithHexString(@"ffffff")
#define kCommon_bg_color                      UIColorWithHexString(@"f2f2f2")
#define kCommon_selected_bg_color             UIColorWithHexString(@"f8f8f8")

// 正文颜色(淡黑色)
#define kCommon_text_title_color              UIColorWithHexString(@"505050")

// 分割线的颜色
#define kCommon_line_color                    UIColorWithHexString(@"eeeeee")
// 线框的颜色
#define kCommon_border_color                  UIColorWithHexString(@"f2f2f2")
// 阴影颜色
#define kCommon_shadow_color                  [UIColor colorWithWhite:0.8 alpha:0.5].CGColor

// 占位色
#define kCommon_placeHolder_color             UIColorWithHexString(@"999999")
// disabled状态按钮颜色
#define kCommon_btn_disabled_title_color      UIColorWithHexString(@"cccccc")
#define kCommon_btn_disabled_bg_color         UIColorWithHexString(@"e6e6e6")

/*===============Color finish==============*/

#endif /* CommonThemeMacro_h */
