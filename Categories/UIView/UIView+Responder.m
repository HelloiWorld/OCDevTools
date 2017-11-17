//
//  UIView+Responder.m
//  职通车
//
//  Created by PengZK on 2017/8/1.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "UIView+Responder.h"

@implementation UIView (Responder)

- (UIViewController*)nextResponderOfVC {
    id responder = self.nextResponder;
    while (![responder isKindOfClass: [UIViewController class]] && ![responder isKindOfClass: [UIWindow class]])
    {
        responder = [responder nextResponder];
    }
    return responder;
}

- (UIViewController *)viewController{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
