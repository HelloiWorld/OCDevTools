//
//  EmptyStatusView.m
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#import "EmptyStatusView.h"
#import <UIImage+GIF.h>
#import <Masonry.h>
#import "UILabel+LineSpace.h"
#import "CommonThemeMacro.h"

@implementation EmptyStatusView

+ (instancetype)initFromXibWithFrame:(CGRect)frame {
    EmptyStatusView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    view.frame = frame;
    [view setupBtnStyle];
    return view;
}

+ (UIView *)initWithFrame:(CGRect)frame andImageName:(NSString*)imgName andLabelText:(NSString*)text {
    UIView *emptyView = [[UIView alloc] init];
    emptyView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    emptyView.backgroundColor = UIColorWithHexString(@"#f2f2f2");
    
    UIImageView *emptyImageView = [[UIImageView alloc] init];
    emptyImageView.image = [UIImage imageNamed:imgName];
    [emptyImageView sizeToFit];
    [emptyView addSubview:emptyImageView];
    [emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(emptyView.mas_centerX);
        make.centerY.equalTo(emptyView.mas_centerY).multipliedBy(196/333.5f);
//        make.topMargin.equalTo(emptyView.mas_top).offset(108);
        make.width.equalTo(emptyView.mas_width).multipliedBy(19/32.f);
        make.height.equalTo(emptyView.mas_width).multipliedBy(15/32.f);
    }];
    
    UILabel *emptyTipLabel = [[UILabel alloc] init];
    emptyTipLabel.font = [UIFont systemFontOfSize:14];
    emptyTipLabel.textColor = UIColorWithHexString(@"#cccccc");
    emptyTipLabel.text = text;
    [emptyTipLabel sizeToFit];
    [emptyView addSubview:emptyTipLabel];
    [emptyTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(emptyImageView.mas_centerX);
        make.topMargin.equalTo(emptyImageView.mas_bottom).offset(22);
    }];
    
    return emptyView;
}

- (void)setupBtnStyle{
    _reloadBtn.layer.borderWidth = 0.5;
    _reloadBtn.layer.borderColor = kCommon_main_color.CGColor;
    _reloadBtn.layer.cornerRadius = 17.5;
    _reloadBtn.layer.masksToBounds = YES;
}

- (void)setupViewWithImageName:(NSString*)imgName andLabelText:(NSString*)text{
    self.backgroundColor = kCommon_bg_color;
    self.emptyImageView.hidden = NO;
    self.emptyLbl.hidden = NO;
    
    self.emptyImageView.image = [UIImage imageNamed:imgName];
    [self.emptyLbl setText:text lineSpacing:6];
}

#pragma mark - Load

- (UIImageView *)animatedImageView {
    if (!_animatedImageView) {
        _animatedImageView = [[UIImageView alloc] initWithImage:[UIImage sd_animatedGIFNamed:@"2a16117aaf726e3d6208cf40001c8524"]];
        [self addSubview:_animatedImageView];
        
        [_animatedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).with.offset(-56);
        }];
    }
    return _animatedImageView;
}

- (void)setupNetworkErrorView{
    self.backgroundColor = kCommon_bg_color;
    self.emptyImageView.hidden = NO;
    self.emptyLbl.hidden = NO;
    self.reloadBtn.hidden = NO;
    self.animatedImageView.hidden = YES;
    
    self.emptyImageView.image = [UIImage imageNamed:@"无网络空态"];
    self.emptyLbl.text = @"哎呀，网络出问题了！";
}

- (void)startAnimating{
    self.hidden = NO;
    if (_isLoading) {
        return;
    }
    _isLoading = YES;
    [self loadingAnimation];
}

- (void)stopAnimating{
    self.hidden = YES;
    _isLoading = NO;
}

- (void)loadingAnimation{
    self.backgroundColor = kCommon_window_color;
    self.emptyImageView.hidden = YES;
    self.emptyLbl.hidden = YES;
    self.reloadBtn.hidden = YES;
    self.animatedImageView.hidden = NO;
}

#pragma mark - Action
- (IBAction)reloadBtnClick:(id)sender {
    if (self.block) {
        self.block();
    }
    self.block = nil;
}

@end
