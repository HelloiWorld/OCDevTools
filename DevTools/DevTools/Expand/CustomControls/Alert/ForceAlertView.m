//
//  ForceAlertView.m
//  Football_talk_iphone
//
//  Created by pzk on 16/12/10.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import "ForceAlertView.h"

@implementation ForceAlertView

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated{
//    [super dismissWithClickedButtonIndex:buttonIndex animated:animated];
    return;
}

@end



#import <objc/runtime.h>
static const char alertKey;
@implementation UIAlertView (Block)
- (void)showWithBlock:(successBlock)block{
    if (block) {
        objc_setAssociatedObject(self, &alertKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.delegate = self;
    }
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    successBlock block = objc_getAssociatedObject(self, &alertKey);
    block(buttonIndex);
}

@end
