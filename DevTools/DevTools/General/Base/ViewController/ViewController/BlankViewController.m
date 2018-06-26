//
//  BlankViewController.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "BlankViewController.h"
#import "EmptyStatusView.h"

@interface BlankViewController ()

@end

@implementation BlankViewController

#pragma mark - Empty Status
- (EmptyStatusView*)emptyStatusView {
    EmptyStatusView *emptyView = [self.view viewWithTag:10000];
    if (!emptyView) {
        emptyView = [EmptyStatusView initFromXibWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        emptyView.tag = 10000;
        emptyView.hidden = YES;
        [self.view addSubview:emptyView];
    }
    return emptyView;
}

- (void)showNetworkLoadingView{
    EmptyStatusView *view = [self emptyStatusView];
    [view startAnimating];
    [self.view bringSubviewToFront:view];
}

- (void)showNetworkErrorView:(reloadBlock)block{
    EmptyStatusView *view = [self emptyStatusView];
    [view setupNetworkErrorView];
    view.block = block;
}

- (void)hideEmptyStatusView{
    EmptyStatusView *view = [self emptyStatusView];
    [view stopAnimating];
}

- (void)showEmptyStatusViewWithImageName:(NSString*)imgName
                            andLabelText:(NSString*)text
                         andReplacedView:(UIView*)replacedView{
    EmptyStatusView *view = [self emptyStatusView];
    view.hidden = NO;
    [view setupViewWithImageName:imgName andLabelText:text];
    [replacedView.superview insertSubview:view aboveSubview:replacedView];
    view.frame = replacedView.frame;
}

- (void)dismissEmptyStatusView{
    EmptyStatusView *view = [self emptyStatusView];
    [view removeFromSuperview];
    view = nil;
}

@end
