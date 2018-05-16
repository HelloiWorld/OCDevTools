//
//  ZKTableHeaderView.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "ZKTableHeaderView.h"
#import <Masonry.h>
#import "UILabel+LineSpace.h"
#import "CommonThemeMacro.h"

@implementation ZKTableHeaderView

- (instancetype)initWithLabelText:(NSString*)text {
    if (self = [super init]) {
        self.backgroundColor = kUIColorFromRGB(0xFEFCEC);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = kUIColorFromRGB(0xF7702C);
        label.numberOfLines = 0;
        [label setText:text lineSpacing:2];
        [self addSubview:label];
        self.label = label;
        
        //确定label的最大宽度
        label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 24;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(12);
            make.right.mas_equalTo(self.mas_right).offset(-12);
            make.top.mas_equalTo(self.mas_top).offset(8);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-7);
        }];
        
        CGFloat height = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height);
    }
    return self;
}

@end
