//
//  MobVerifyUIVerifyResultViewController.m
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MobVerifyUIVerifyResultViewController.h"
#import "MobVerifyUIContext.h"

@interface MobVerifyUIVerifyResultViewController ()

/**
 *  配置
 */
@property (nonatomic, strong)MobVerifyUIResultConfig *resultConfig;

/**
 *  描述背景视图
 */
@property (nonatomic, strong)UIView *desBg;

/**
 *  顶部横线
 */
@property (nonatomic, strong)UILabel *topLine;

/**
 *  状态图片
 */
@property (nonatomic, strong)UIImageView *imageView;

/**
 *  状态描述
 */
@property (nonatomic, strong)UILabel *statusDesLbl;

/**
 *  描述
 */
@property (nonatomic, strong)UILabel *desLbl;

/**
 *  底部横线
 */
@property (nonatomic, strong)UILabel *bottomLine;

/**
 *  确认按钮
 */
@property (nonatomic, strong)UIButton *submitBtn;

/**
 *  结果
 */
@property (nonatomic, copy)MobVerifyUICommonResult result;

@end

@implementation MobVerifyUIVerifyResultViewController

- (instancetype)initWithConfig:(MobVerifyUIResultConfig *)resultConfig compeletion:(MobVerifyUICommonResult)result
{
    if(self = [super init])
    {
        _resultConfig = resultConfig;
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
    _desBg = [UIView new];
    [self.view addSubview:_desBg];
    
    
//    _topLine = [UILabel new];
//    _topLine.backgroundColor = [UIColor lightGrayColor];
//    [_desBg addSubview:_topLine];

    _imageView = [UIImageView new];
    [_desBg addSubview:_imageView];
  
    _statusDesLbl = [UILabel new];
    _statusDesLbl.textAlignment = NSTextAlignmentCenter;
    _statusDesLbl.font = [UIFont boldSystemFontOfSize:18.0f];
    [_desBg addSubview:_statusDesLbl];

    _desLbl = [UILabel new];
    _desLbl.textAlignment = NSTextAlignmentCenter;
    _desLbl.lineBreakMode = NSLineBreakByWordWrapping;
    _desLbl.numberOfLines = 0;
    _desLbl.preferredMaxLayoutWidth = self.view.frame.size.width - 30;
//    _desLbl.textColor = MobVeriryDesColor;
    _desLbl.textColor = MobVeriryDesGrayColor;
    [_desLbl setFont:[UIFont systemFontOfSize:12.0f]];
    [_desBg addSubview:_desLbl];
    
//    _bottomLine = [UILabel new];
//    _bottomLine.backgroundColor = [UIColor lightGrayColor];
//    [_desBg addSubview:_bottomLine];
    
    
    //****submit button****
    _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_submitBtn];
    _submitBtn.backgroundColor = MobVeriryBtnBgColor;
    _submitBtn.titleLabel.textColor = [UIColor whiteColor];
    [_submitBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    _submitBtn.layer.cornerRadius = 3.0f;
    _submitBtn.layer.masksToBounds = YES;
    [_submitBtn addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = nil;
    [self.navigationItem setHidesBackButton:YES];
    
    //数据
    _statusDesLbl.text = MobVerifyUILocalized(@"authsucess");
    _desLbl.text = MobVerifyUILocalized(@"jumptohome");
    [_submitBtn setTitle:MobVerifyUILocalized(@"backhome") forState:UIControlStateNormal];
    _imageView.image =
    ({
        NSString *sucessImagePath = [MobVerifyUIBundle pathForResource:@"verifysuccess@3x" ofType:@"png"];
        UIImage *sucessImage = [[UIImage alloc] initWithContentsOfFile:sucessImagePath];
        sucessImage;
    });
    //标题
    [self setCustomTitle:MobVerifyUILocalized(@"title")];
}


- (void)loadUILayout
{
    //layout
    _desBg.translatesAutoresizingMaskIntoConstraints = NO;
    _submitBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _desLbl.translatesAutoresizingMaskIntoConstraints = NO;
//    _topLine.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _statusDesLbl.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //desBg layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_desBg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:80 + MobVerifyUIStatusHeight];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_desBg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_desBg attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self.view addConstraint:rightConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_desBg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:202];
        [_desBg addConstraint:heightConstraint];
    }
    
    //topline layout
    {
//        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//        [_desBg addConstraint:topConstraint];
//
//        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
//        [_desBg addConstraint:leftConstraint];
//
//        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
//        [_desBg addConstraint:rightConstraint];
//
//
//
//        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_topLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:0.5];
//        [_topLine addConstraint:heightConstraint];
    }
    
    //imageview layout
    {
        
        _imageView.frame = CGRectMake(30, 30, 10 , 10);
        
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeTop multiplier:1.0 constant:30];
        [_desBg addConstraint:topConstraint];
        
        
        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [_desBg addConstraint:centerXConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:80];
        [_imageView addConstraint:widthConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:80];
        [_imageView addConstraint:heightConstraint];
        
    }
    
    
    //statusDesLbl layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
        [_desBg addConstraint:topConstraint];
        
        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [_desBg addConstraint:centerXConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150];
        [_statusDesLbl addConstraint:widthConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_statusDesLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
        [_statusDesLbl addConstraint:heightConstraint];
        
    }
    
    
    
    //des layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_statusDesLbl attribute:NSLayoutAttributeBottom multiplier:1.0 constant:14];
        [_desBg addConstraint:topConstraint];
        
        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [_desBg addConstraint:centerXConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:200];
        [_desLbl addConstraint:widthConstraint];
        
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_desLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:20];
        [_desLbl addConstraint:heightConstraint];
        
    }
    
    
    
    //bottomline layout
    {
//        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
//        [_desBg addConstraint:bottomConstraint];
//
//        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
//        [_desBg addConstraint:leftConstraint];
//
//        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
//        [_desBg addConstraint:rightConstraint];
//
//
//
//        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_bottomLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:0.5];
//        [_bottomLine addConstraint:heightConstraint];
    }
    
    //button layout
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_desBg attribute:NSLayoutAttributeBottom multiplier:1.0 constant:36];
        [self.view addConstraint:topConstraint];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
        [self.view addConstraint:leftConstraint];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15];
        [self.view addConstraint:rightConstraint];
        
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_submitBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:46];
        [_submitBtn addConstraint:heightConstraint];
    }
}

- (void)loadConfig
{
    [super loadConfig:_resultConfig];


    
    if(_resultConfig.stateImage)
        _imageView.image = _resultConfig.stateImage;
    
    if(_resultConfig.stateTitle)
        _statusDesLbl.text = _resultConfig.stateTitle;
    
    if(_resultConfig.stateTitleColor)
        _statusDesLbl.textColor = _resultConfig.stateTitleColor;
    
    if(_resultConfig.stateTitleFont)
        _statusDesLbl.font = _resultConfig.stateTitleFont;

    if(_resultConfig.des)
        _desLbl.text = _resultConfig.des;
    
    if(_resultConfig.desColor)
        _desLbl.textColor = _resultConfig.desColor;
    
    if(_resultConfig.desFont)
        _desLbl.font = _resultConfig.desFont;
    
    if(_resultConfig.submitTitle)
        [_submitBtn setTitle:_resultConfig.submitTitle forState:UIControlStateNormal];
    
    if(_resultConfig.submitTitleColor)
        [_submitBtn setTitleColor:_resultConfig.submitTitleColor forState:UIControlStateNormal];
    
    if(_resultConfig.submitTitleFont)
        [_submitBtn.titleLabel setFont:_resultConfig.submitTitleFont];
    
    if(_resultConfig.submitBgColor)
        [_submitBtn setBackgroundColor:_resultConfig.submitBgColor];
    
    if(_resultConfig.submitBackgroundImage)
        [_submitBtn setBackgroundImage:_resultConfig.submitBackgroundImage forState:UIControlStateNormal];
    
    if(_resultConfig.cornerRadius)
    {
        _submitBtn.layer.cornerRadius = _resultConfig.cornerRadius;
        _submitBtn.layer.masksToBounds = YES;
    }
}

- (void)confirm:(UIButton *)button
{
    if([self.navigationController.viewControllers containsObject:[MobVerifyUIContext defaultContext].rootVC])
    {
        [self.navigationController popToViewController:[MobVerifyUIContext defaultContext].rootVC animated:YES];
    }
    else
    {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    
    if(_result)
    {
        _result(nil);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
