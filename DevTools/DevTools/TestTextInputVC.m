//
//  TestTextInputVC.m
//  DevTools
//
//  Created by PengZK on 2018/3/13.
//  Copyright © 2018年 None. All rights reserved.
//

#import "TestTextInputVC.h"
#import "LimitTextField.h"
#import "LimitTextView.h"

@interface TestTextInputVC ()<UITextFieldDelegate,LimitTextViewDelegate>

@property (weak, nonatomic) IBOutlet LimitTextField *testTextField;
@property (weak, nonatomic) IBOutlet LimitTextView *testTextView;
@property (weak, nonatomic) IBOutlet UILabel *wordNumLabel;

@end

#define MAX_LIMIT_NUMS 200
#define InputTipTextDesc @"这个是默认提示字符"

@implementation TestTextInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configView];
}

- (void)configView {
    _testTextField.limitLength = 20;
    
    _testTextView.textDelegate = self;
    _testTextView.limitLength = MAX_LIMIT_NUMS;
    _testTextView.placeHolderText = InputTipTextDesc;
}

#pragma mark - ZTCLimitTextViewDelegate
- (void)updateLimitNumLabel{
    if (![_testTextView.text isEqualToString:InputTipTextDesc]) {
        self.wordNumLabel.text = [NSString stringWithFormat:@"%ld/%d",MIN(_testTextView.text.length,MAX_LIMIT_NUMS),MAX_LIMIT_NUMS];
    } else {
        self.wordNumLabel.text = [NSString stringWithFormat:@"%d/%d",0,MAX_LIMIT_NUMS];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
