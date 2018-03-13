//
//  UITextField+Editing.m
//  职通车
//
//  Created by PengZK on 2017/8/28.
//  Copyright © 2017年 ZTC. All rights reserved.
//

#import "UITextField+Editing.h"
#import "SwizzlingDefine.h"

@implementation UITextField (Editing)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([UITextField class] ,@selector(textRectForBounds:), @selector(swizzling_textRectForBounds:));
        swizzling_exchangeMethod([UITextField class] ,@selector(editingRectForBounds:), @selector(swizzling_editingRectForBounds:));
//        swizzling_exchangeMethod([UITextField class] ,@selector(layoutSubviews), @selector(swizzling_layoutSubviews));
        // 光标颜色
//        [[UITextField appearance] setTintColor:UIColorFromRGB(0x20c05c)];
    });
}


- (CGRect)swizzling_textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 2, 1);
}

// 解决编辑状态文字下移的问题
- (CGRect)swizzling_editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 2, 1);
}

//如果文字尺寸不高，显示区域足够大，UITextField就可以正常显示。
//当UITextField不能完全显示汉字的时候，就会变成可滚动，文字就会低于中心线，点击删除按钮的时候，看起来就会向下偏移。
//使用NSLOG输出UITextField的layoutSubviews方法，显示UITextEditor的contentOffset发生了偏移。
//因此重写layoutSuviews方法，在[super layoutSubview]之后重置UITextEditor的contentOffset.y 就可以了。
//- (void)swizzling_layoutSubviews
//{
//    [super layoutSubviews];
//    for (UIScrollView *view in self.subviews)
//    {
//        if ([view isKindOfClass:[UIScrollView class]])
//        {
//            CGPoint offset = view.contentOffset;
//            if (offset.y != 0)
//            {
//                offset.y = 0;
//                view.contentOffset = offset;
//            }
//            break;
//        }
//    }
//
//}

//作者：biubiu2017
//链接：http://www.jianshu.com/p/641a0cbcabb0
//來源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

@end
