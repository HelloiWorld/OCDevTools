//
//  EmptyStatusView.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^reloadBlock)(void);

@interface EmptyStatusView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *emptyImageView;
@property (weak, nonatomic) IBOutlet UILabel *emptyLbl;
@property (weak, nonatomic) IBOutlet UIButton *reloadBtn;
@property (nonatomic, strong) UIImageView *animatedImageView;

//无xib加载
+ (UIView *)initWithFrame:(CGRect)frame andImageName:(NSString*)imgName andLabelText:(NSString*)text;

//从xib加载
+ (instancetype)initFromXibWithFrame:(CGRect)frame;
/// 展示常规空态图
- (void)setupViewWithImageName:(NSString*)imgName andLabelText:(NSString*)text;

/// 用于加载等待动画
@property (nonatomic, assign, readonly) BOOL isLoading;
- (void)startAnimating;
- (void)stopAnimating;

/// 用于网络异常的情况
@property (nonatomic, copy) reloadBlock block;
- (void)setupNetworkErrorView;

@end
