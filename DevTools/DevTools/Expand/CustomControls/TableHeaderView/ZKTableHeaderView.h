//
//  ZKTableHeaderView.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKTableHeaderView : UIView

- (instancetype)initWithLabelText:(NSString*)text;

@property (nonatomic, strong) UILabel *label;

@end
