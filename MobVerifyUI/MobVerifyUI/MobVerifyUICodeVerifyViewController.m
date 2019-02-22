//
//  MobVerifyUICommitCodeViewController.m
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MobVerifyUICodeVerifyViewController.h"
#import "MobVerifyUIProcessHUD.h"
#import "MobVerifyUIVerifyResultViewController.h"
#import "MobVerifyUIContext.h"

@interface MobVerifyUICodeVerifyViewController ()

/**
 *  配置
 */
@property (nonatomic, strong)MobVerifyUICodeVerifyConfig *codeConfig;

/**
 *  手机号
 */
@property (nonatomic, strong)NSString *phoneNumber;

/**
 *  区域号
 */
@property (nonatomic, strong)NSString *zone;

/**
 *  失败背景视图
 */
@property (nonatomic, strong)UIView *failDesBg;

/**
 *  失败图片
 */
@property (nonatomic, strong)UIImageView *imageView;

/**
 *  失败状态label
 */
@property (nonatomic, strong)UILabel *statusDesLbl;

/**
 *  失败描述
 */
@property (nonatomic, strong)UILabel *failDesLbl;

/**
 *  号码背景视图
 */
@property (nonatomic, strong)UIView *phoneBg;

/**
 *  顶部横线
 */
//@property (nonatomic, strong)UILabel *topLine;

/**
 *  号码标题label
 */
@property (nonatomic, strong)UILabel *phoneTitleLbl;

/**
 *  号码输入框
 */
@property (nonatomic, strong)UITextField *codeTf;

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

@implementation MobVerifyUICodeVerifyViewController


- (instancetype)initWithConfig:(MobVerifyUICodeVerifyConfig *)codeConfig phoneNumber:(NSString *)phoneNumber zone:(NSString *)zone compeletion:(MobVerifyUICommonResult)result
{
    if(self = [super init])
    {
        _codeConfig = codeConfig;
        _result = result;
        _phoneNumber = phoneNumber;
        _zone = zone;
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

    //****fail des****
    _failDesBg = [UIView new];
    [self.view addSubview:_failDesBg];

    
    _imageView = [UIImageView new];
    [_failDesBg addSubview:_imageView];
    
    _statusDesLbl = [UILabel new];
    _statusDesLbl.textAlignment = NSTextAlignmentCenter;
    _statusDesLbl.font = [UIFont boldSystemFontOfSize:18.0f];
    [_failDesBg addSubview:_statusDesLbl];
    
    _failDesLbl = [UILabel new];
    _failDesLbl.textAlignment = NSTextAlignmentCenter;
    _failDesLbl.lineBreakMode = NSLineBreakByWordWrapping;
    _failDesLbl.numberOfLines = 0;
    _failDesLbl.preferredMaxLayoutWidth = self.view.frame.size.width - 30;
    _failDesLbl.textColor = MobVeriryDesGrayColor;
    [_failDesLbl setFont:[UIFont systemFontOfSize:12.0f]];
    [_failDesBg addSubview:_failDesLbl];
    
    
    //号码
    _phoneBg = [UIView new];
    [self.view addSubview:_phoneBg];
    
    
//    _topLine = [UILabel new];
//    _topLine.backgroundColor = [UIColor lightGrayColor];
//    [_phoneBg addSubview:_topLine];
    
    _phoneTitleLbl = [UILabel new];
    _phoneTitleLbl.font = [UIFont systemFontOfSize:14.0f];
    [_phoneBg addSubview:_phoneTitleLbl];
    
    _codeTf = [UITextField new];
    _codeTf.font = [UIFont systemFontOfSize:14.0f];
    _codeTf.keyboardType = UIKeyboardTypeNumberPad;
    [_phoneBg addSubview:_codeTf];
    
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
    _desLbl.textAlignment = NSTextAlignmentCenter;
    _desLbl.lineBreakMode = NSLineBreakByWordWrapping;
    _desLbl.numberOfLines = 0;
    _desLbl.preferredMaxLayoutWidth = self.view.frame.size.width - 30;
    _desLbl.textColor = MobVeriryDesColor;
    [_desLbl setFont:[UIFont systemFontOfSize:12.0f]];
    
    [_phoneBg addSubview:_desLbl];
    
    //数据
    _statusDesLbl.text = MobVerifyUILocalized(@"authfail");
    _phoneTitleLbl.text = MobVerifyUILocalized(@"Code");
    _codeTf.placeholder = MobVerifyUILocalized(@"verifycode");
    _desLbl.text = MobVerifyUILocalized(@"carddes");
    _failDesLbl.text = MobVerifyUILocalized(@"authfaildes");
    [_submitBtn setTitle:MobVerifyUILocalized(@"title") forState:UIControlStateNormal];
    _imageView.image =
    ({
        NSString *sucessImagePath = [MobVerifyUIBundle pathForResource:@"verifyfail@3x" ofType:@"png"];
        UIImage *sucessImage = [[UIImage alloc] initWithContentsOfFile:sucessImagePath];
        sucessImage;
    });
    //标题
    [self setCustomTitle:MobVerifyUILocalized(@"title")];
     
}

- (void)loadUILayout
{
    
    //layout
    _phoneBg.translatesAutoresizingMaskIntoConstraints = NO;
    _submitBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _desLbl.translatesAutoresizingMaskIntoConstraints = NO;
//    _topLine.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    _codeTf.translatesAutoresizingMaskIntoConstraints = NO;
    _phoneTitleLbl.translatesAutoresizingMaskIntoConstraints = NO;
    _failDesLbl.translatesAutoresizingMaskIntoConstraints = NO;
    _failDesBg.translatesAutoresizingMaskIntoConstraints = NO;
    _failDesLbl.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _statusDesLbl.translatesAutoresizingMaskIntoConstraints = NO;
    _failDesLbl.translatesAutoresizingMaskIntoConstraints = NO;
    

    //failDesBg layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_failDesBg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:80 + MobVerifyUIStatusHeight];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_failDesBg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_failDesBg attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self.view addConstraint:rightConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_failDesBg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:202];
        [_failDesBg addConstraint:heightConstraint];
    }
    

    
    //imageview layout
    {
        
        
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_failDesBg attribute:NSLayoutAttributeTop multiplier:1.0 constant:30];
        [_failDesBg addConstraint:topConstraint];
        
        
        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_failDesBg attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [_failDesBg addConstraint:centerXConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:80];
        [_imageView addConstraint:widthConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:80];
        [_imageView addConstraint:heightConstraint];
        
    }
    
    
    //statusDesLbl layout
    {
        _statusDesLbl.frame = CGRectMake(100, 100, 100, 18);
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
        [_failDesBg addConstraint:topConstraint];

        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [_failDesBg addConstraint:centerXConstraint];

        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150];
        [_statusDesLbl addConstraint:widthConstraint];

        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:18];
        [_statusDesLbl addConstraint:heightConstraint];

    }
    
    
    //fail des layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_failDesLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_statusDesLbl attribute:NSLayoutAttributeBottom multiplier:1.0 constant:14];
        [_failDesBg addConstraint:topConstraint];

        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_failDesLbl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_failDesBg attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [_failDesBg addConstraint:centerXConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_failDesLbl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:200];
        [_failDesLbl addConstraint:widthConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_failDesLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:20];
        [_failDesLbl addConstraint:heightConstraint];
        
    }
    
    
    //phoneBg layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:300];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self.view addConstraint:rightConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_phoneBg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
        [_phoneBg addConstraint:heightConstraint];
    }
    
    //topline layout
    {
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
    }
    
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
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_codeTf attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100];
        [_phoneBg addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_codeTf attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeRight multiplier:1.0 constant:5];
        [_phoneBg addConstraint:rightConstraint];
        
        NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_codeTf attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:5];
        [_phoneBg addConstraint:centerYConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_codeTf attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:20];
        [_codeTf addConstraint:heightConstraint];
        
        
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
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_phoneBg attribute:NSLayoutAttributeBottom multiplier:1.0 constant:21];
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
    [super loadConfig:_codeConfig];

    if(_codeConfig.failImage)
        _imageView.image = _codeConfig.failImage;
    
    
    if(_codeConfig.stateTitle)
        _failDesLbl.text = _codeConfig.stateTitle;
    
    if(_codeConfig.stateTitleColor)
        _failDesLbl.textColor = _codeConfig.stateTitleColor;
    
    if(_codeConfig.stateTitleFont)
        _failDesLbl.font = _codeConfig.stateTitleFont;
    
    
    if(_codeConfig.failDesTitle)
        _statusDesLbl.text = _codeConfig.failDesTitle;
    
    if(_codeConfig.failDesColor)
        _statusDesLbl.textColor = _codeConfig.failDesColor;
    
    if(_codeConfig.failDesFont)
        _statusDesLbl.font = _codeConfig.failDesFont;
    

    
    if(_codeConfig.localTitle)
        _phoneTitleLbl.text = _codeConfig.localTitle;
    
    if(_codeConfig.localTitleColor)
        _phoneTitleLbl.textColor = _codeConfig.localTitleColor;
    
    if(_codeConfig.localTitleFont)
        _phoneTitleLbl.font = _codeConfig.localTitleFont;
    
    if(_codeConfig.phonePlaceholder)
        _codeTf.placeholder = _codeConfig.phonePlaceholder;
    
    if(_codeConfig.phoneFont)
        _codeTf.font = _codeConfig.phoneFont;
    
    if(_codeConfig.bottomLineColor)
        _bottomLine.backgroundColor = _codeConfig.bottomLineColor;
    
    
    if(_codeConfig.des)
        _desLbl.text = _codeConfig.des;
    
    if(_codeConfig.desColor)
        _desLbl.textColor = _codeConfig.desColor;
    
    if(_codeConfig.desFont)
        _desLbl.font = _codeConfig.desFont;
    
    if(_codeConfig.submitTitle)
        [_submitBtn setTitle:_codeConfig.submitTitle forState:UIControlStateNormal];
    
    if(_codeConfig.submitTitleColor)
        [_submitBtn setTitleColor:_codeConfig.submitTitleColor forState:UIControlStateNormal];
    
    if(_codeConfig.submitTitleFont)
        [_submitBtn.titleLabel setFont:_codeConfig.submitTitleFont];
    
    if(_codeConfig.submitBgColor)
        [_submitBtn setBackgroundColor:_codeConfig.submitBgColor];
    
    if(_codeConfig.submitBackgroundImage)
        [_submitBtn setBackgroundImage:_codeConfig.submitBackgroundImage forState:UIControlStateNormal];
    
    if(_codeConfig.cornerRadius)
    {
        _submitBtn.layer.cornerRadius = _codeConfig.cornerRadius;
        _submitBtn.layer.masksToBounds = YES;
    }
}


- (void)confirm:(id)sender
{
    [_codeTf resignFirstResponder];
    [MobVerifyUIProcessHUD showProcessHUDWithInfo:@"加载中..."];
    
    [MobVerify verifyWithCode:_codeTf.text phoneNumber:_phoneNumber  zone:_zone result:^(NSError *error) {
        
        if(!error)
        {
            [MobVerifyUIProcessHUD dismiss];
            
            MobVerifyUIVerifyResultViewController *resultVc = [[MobVerifyUIVerifyResultViewController alloc] initWithConfig:[MobVerifyUIContext defaultContext].resultConfig compeletion:_result];
            [self.navigationController pushViewController:resultVc animated:YES];
        }
        else
        {
            [MobVerifyUIProcessHUD showFailInfo:error.userInfo[@"description"]];
            [MobVerifyUIProcessHUD dismissWithDelay:1.5 result:^{
                
            }];
        }
        
    }];

}

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
