//
//  ZKWebViewController.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "ZKWebViewController.h"
#import "CommonThemeMacro.h"

@interface ZKWebViewController ()

@end

@implementation ZKWebViewController

- (instancetype)initWithURL:(NSString *)url {
    if (self = [super initWithURL:url]) {
        self.title = @" ";
        self.hidesBottomBarWhenPushed = YES;
        self.useUIWebView = YES;
        self.tintColor = kCommon_main_color;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
