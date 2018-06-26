//
//  ForceAlertView.h
//  Football_talk_iphone
//
//  Created by pzk on 16/12/10.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 强制升级，点击后弹框不消失
 */
@interface ForceAlertView : UIAlertView

@end



typedef void (^successBlock)(NSInteger buttonIndex);
/**
 为UIAlertView增加block方法
 */
@interface UIAlertView (Block)<UIAlertViewDelegate>
- (void)showWithBlock:(successBlock)block;
@end
