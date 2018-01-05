//
//  UIButton+EdgeInsets.m
//  Tools
//
//  Created by PengZK on 2018/1/5.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import "UIButton+EdgeInsets.h"

@implementation UIButton (EdgeInsets)

- (void)verticalImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    //解决直接使用titleLabel.frame.size.width,原因为有时候获取到0值,可直接使用self.titleLabel.intrinsicContentSize.width;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
}

- (void)reverseImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    //解决直接使用titleLabel.frame.size.width,原因为有时候获取到0值,可直接使用self.titleLabel.intrinsicContentSize.width;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    self.imageEdgeInsets = UIEdgeInsetsMake(0, (titleSize.width + spacing / 2.0), 0, - (titleSize.width + spacing / 2.0));
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - (imageSize.width + spacing / 2.0), 0, (imageSize.width + spacing / 2.0));
}

@end
