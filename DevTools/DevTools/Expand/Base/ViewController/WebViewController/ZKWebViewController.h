//
//  ZKWebViewController.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "CHWebViewController.h"

static NSString * const kUrl_user_protocol = @"";
static NSString * const kUrl_help = @"";

@interface ZKWebViewController : CHWebViewController

// override super, set special configuration
- (instancetype)initWithURL:(NSString *)url;

@end
