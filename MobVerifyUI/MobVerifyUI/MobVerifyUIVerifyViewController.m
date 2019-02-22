//
//  MobVerifyUIVerifyViewController.m
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MobVerifyUIVerifyViewController.h"
#import <UIKit/UIKit.h>
#import "MobVerifyUIProcessHUD.h"
#import "MobVerifyUIVerifyResultViewController.h"
#import "MobVerifyUICodeVerifyViewController.h"
#import "MobVerifyUIContext.h"

@interface MobVerifyUIVerifyViewController ()

/**
 *  配置
 */
@property (nonatomic, strong)MobVerifyUIVerifyConfig *verifyConfig;

/**
 *  号码背景视图
 */
@property (nonatomic, strong)UIView *phoneBg;

/**
 *  顶部横线
 */
@property (nonatomic, strong)UILabel *topLine;

/**
 *  号码标题label
 */
@property (nonatomic, strong)UILabel *phoneTitleLbl;

/**
 *  号码输入框
 */
@property (nonatomic, strong)UITextField *phoneTf;

/**
 *  底部横线
 */
@property (nonatomic, strong)UILabel *bottomLine;

/**
 *  按钮
 */
@property (nonatomic, strong)UIButton *submitBtn;

/**
 *  描述label
 */
@property (nonatomic, strong)UILabel *desLbl;

/**
 *  结果
 */
@property (nonatomic, copy)MobVerifyUICommonResult result;

@end

@implementation MobVerifyUIVerifyViewController

- (instancetype)initWithConfig:(MobVerifyUIVerifyConfig *)verifyConfig compeletion:(MobVerifyUICommonResult)result
{
    if(self = [super init])
    {
        _verifyConfig = verifyConfig;
        _result = result;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //加载ui
    [self loadUI];
    
    //加载布局
    [self loadUILayout];
    
    //配置填充
    [self loadConfig];
}

- (void)loadUI
{
    

    
    //号码
    _phoneBg = [UIView new];
    [self.view addSubview:_phoneBg];
    
    
//    _topLine = [UILabel new];
//    _topLine.backgroundColor = [UIColor lightGrayColor];
//    [_phoneBg addSubview:_topLine];
    
    _phoneTitleLbl = [UILabel new];
    _phoneTitleLbl.font = [UIFont systemFontOfSize:14.0f];
    [_phoneBg addSubview:_phoneTitleLbl];
    
    _phoneTf = [UITextField new];
    _phoneTf.font = [UIFont systemFontOfSize:14.0f];
    _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
    [_phoneBg addSubview:_phoneTf];
    
    _bottomLine = [UILabel new];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    [_phoneBg addSubview:_bottomLine];
    
    
    //****submit button****
    _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_submitBtn];
    _submitBtn.backgroundColor = MobVeriryBtnBgColor;
    _submitBtn.titleLabel.textColor = [UIColor whiteColor];
    [_submitBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    _submitBtn.layer.cornerRadius = 3.0f;
    _submitBtn.layer.masksToBounds = YES;
    [_submitBtn addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    
    //描述
    _desLbl = [UILabel new];
    _desLbl.font = [UIFont systemFontOfSize:14.0f];
    _desLbl.textAlignment = NSTextAlignmentCenter;
    _desLbl.lineBreakMode = NSLineBreakByWordWrapping;
    _desLbl.numberOfLines = 0;
    _desLbl.preferredMaxLayoutWidth = self.view.frame.size.width - 30;
    _desLbl.textColor = MobVeriryDesColor;
    [_desLbl setFont:[UIFont systemFontOfSize:12.0f]];
    [_phoneBg addSubview:_desLbl];
    //标题
    [self setCustomTitle:MobVerifyUILocalized(@"title")];
    
    //数据
    _phoneTitleLbl.text = @"+86";
    _phoneTf.placeholder = MobVerifyUILocalized(@"mytelfield");
    _desLbl.text = MobVerifyUILocalized(@"carddes");
    [_submitBtn setTitle:MobVerifyUILocalized(@"title") forState:UIControlStateNormal];

}


- (void)loadUILayout
{
    
    //layout
    _phoneBg.translatesAutoresizingMaskIntoConstraints = NO;
    _submitBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _desLbl.translatesAutoresizingMaskIntoConstraints = NO;
    _topLine.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    _phoneTf.translatesAutoresizingMaskIntoConstraints = NO;
    _phoneTitleLbl.translatesAutoresizingMaskIntoConstraints = NO;
    
    //phoneBg layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:160 + MobVerifyUIStatusHeight];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self.view addConstraint:rightConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
        [_phoneBg addConstraint:heightConstraint];
    }
    
    //topline layout
//    {
//        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//        [_phoneBg addConstraint:topConstraint];
//
//        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
//        [_phoneBg addConstraint:leftConstraint];
//
//        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
//        [_phoneBg addConstraint:rightConstraint];
//
//
//
//        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:0.5];
//        [_topLine addConstraint:heightConstraint];
//    }
    
    //phone title layout
    {
        
        NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_phoneTitleLbl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:5];
        [_phoneBg addConstraint:centerYConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_phoneTitleLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
        [_phoneBg addConstraint:leftConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_phoneTitleLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:20];
        [_phoneTitleLbl addConstraint:heightConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_phoneTitleLbl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:84];
        [_phoneTitleLbl addConstraint:widthConstraint];
    }
    
    //phone textfield layout
    {
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_phoneTf attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:110];
        [_phoneBg addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_phoneTf attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeRight multiplier:1.0 constant:5];
        [_phoneBg addConstraint:rightConstraint];
        
        NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_phoneTf attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:5];
        [_phoneBg addConstraint:centerYConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_phoneTf attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:20];
        [_phoneTf addConstraint:heightConstraint];
        
        
    }
    
    //bottomline layout
    {
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [_phoneBg addConstraint:bottomConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
        [_phoneBg addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [_phoneBg addConstraint:rightConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:0.5];
        [_bottomLine addConstraint:heightConstraint];
    }
    
    //button layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomLine attribute:NSLayoutAttributeBottom multiplier:1.0 constant:21];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15];
        [self.view addConstraint:rightConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:46];
        [_submitBtn addConstraint:heightConstraint];
    }
    
    //des layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_submitBtn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15];
        [self.view addConstraint:rightConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
        [_desLbl addConstraint:heightConstraint];
        
    }
}


- (void)loadConfig
{
    [super loadConfig:_verifyConfig];


    if(_verifyConfig.localTitle)
        _phoneTitleLbl.text = _verifyConfig.localTitle;
    
    if(_verifyConfig.localTitleColor)
        _phoneTitleLbl.textColor = _verifyConfig.localTitleColor;
    
    if(_verifyConfig.localTitleFont)
        _phoneTitleLbl.font = _verifyConfig.localTitleFont;
    
    if(_verifyConfig.phonePlaceholder)
        _phoneTf.placeholder = _verifyConfig.phonePlaceholder;
    
    if(_verifyConfig.phoneFont)
        _phoneTf.font = _verifyConfig.phoneFont;
    
    if(_verifyConfig.bottomLineColor)
        _topLine.backgroundColor = _verifyConfig.bottomLineColor;
    
    
    if(_verifyConfig.des)
        _desLbl.text = _verifyConfig.des;
    
    if(_verifyConfig.desColor)
        _desLbl.textColor = _verifyConfig.desColor;
    
    if(_verifyConfig.desFont)
        _desLbl.font = _verifyConfig.desFont;
    
    if(_verifyConfig.submitTitle)
        [_submitBtn setTitle:_verifyConfig.submitTitle forState:UIControlStateNormal];
    
    if(_verifyConfig.submitTitleColor)
        [_submitBtn setTitleColor:_verifyConfig.submitTitleColor forState:UIControlStateNormal];
    
    if(_verifyConfig.submitTitleFont)
        [_submitBtn.titleLabel setFont:_verifyConfig.submitTitleFont];
    
    if(_verifyConfig.submitBgColor)
        [_submitBtn setBackgroundColor:_verifyConfig.submitBgColor];
    
    if(_verifyConfig.submitBackgroundImage)
        [_submitBtn setBackgroundImage:_verifyConfig.submitBackgroundImage forState:UIControlStateNormal];
    
    if(_verifyConfig.cornerRadius)
    {
        _submitBtn.layer.cornerRadius = _verifyConfig.cornerRadius;
        _submitBtn.layer.masksToBounds = YES;
    }
}

//dismiss ViewController
- (void)confirm:(id)sender
{

    [MobVerifyUIProcessHUD showProcessHUDWithInfo:@"加载中..."];
    
    [_phoneTf resignFirstResponder];

	[MobVerify cloudVerifyWithPhoneNumber:_phoneTf.text zone:@"86" template:_verifyConfig.tmpCode result:^(NSError *error) {
        [MobVerifyUIProcessHUD dismiss];
		
        if(!error)
        {
            MobVerifyUIVerifyResultViewController *resultVc = [[MobVerifyUIVerifyResultViewController alloc] initWithConfig:[MobVerifyUIContext defaultContext].resultConfig compeletion:_result];
            [self.navigationController pushViewController:resultVc animated:YES];
        }
        else
        {
            
            //验证不通过，启用了短信验证
            if(error.code == 6119003)
            {
                MobVerifyUICodeVerifyViewController *resultVc = [[MobVerifyUICodeVerifyViewController alloc] initWithConfig:[MobVerifyUIContext defaultContext].codeVerifyConfig phoneNumber:_phoneTf.text zone:@"86" compeletion:_result];
                [self.navigationController pushViewController:resultVc animated:YES];
            }
            else
            {
                [MobVerifyUIProcessHUD showFailInfo:error.userInfo[@"description"]];
                [MobVerifyUIProcessHUD dismissWithDelay:1.5 result:^{
                    
                }];
            }
            
        }

    }];
    

}

//返回
- (void)backAction:(UIButton*)button
{
    if(self.navigationController.viewControllers.firstObject == self)
    {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
