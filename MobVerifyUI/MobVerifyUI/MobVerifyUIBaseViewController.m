//
//  MobVerifyUIBaseViewController.m
//  MobAuthDemo
//
//  Created by hower on 2018/12/25.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MobVerifyUIBaseViewController.h"
#import "MobVerifyUIProcessHUD.h"

@interface MobVerifyUIBaseViewController ()

@property (nonatomic, strong) UILabel *cTitleLabel;
@end

@implementation MobVerifyUIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cTitleLabel = [UILabel new];
    _cTitleLabel.backgroundColor = [UIColor clearColor];
    _cTitleLabel.font = [UIFont systemFontOfSize:16.0f];
    _cTitleLabel.textColor = [UIColor blackColor];
    _cTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:_cTitleLabel];

    [self configBack];

}

- (void)configBack
{
    NSString *path = [MobVerifyUIBundle pathForResource:@"back" ofType:@"png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 50, 50);
    [backButton setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateHighlighted];
    // 让按钮内部的所有内容左对齐
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0); // 这里微调返回键的位置可以让它看上去和左边紧贴
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
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


- (void) loadConfig:(MobVerifyUIBaseConfig *)config
{
    if(config.navTitle)
        _cTitleLabel.text = config.navTitle;
    
    if(config.navTitleColor)
        _cTitleLabel.textColor = config.navTitleColor;
    
    if(config.navTitleColor)
        _cTitleLabel.font = config.navTitleFont;
    
    
    if(config.navTitle)
        _cTitleLabel.text = config.navTitle;
    
    if(config.navTitleColor)
        _cTitleLabel.textColor = config.navTitleColor;
    
    if(config.navTintColor)
        self.navigationController.navigationBar.tintColor = config.navTintColor;
    
    if(config.navBackgroundColor)
        self.navigationController.navigationBar.backgroundColor = config.navBackgroundColor;

    
    if(config.navCustomTitleView)
        [self.navigationItem setTitleView:config.navCustomTitleView];

}

- (void) setCustomTitle:(NSString *)title
{
    _cTitleLabel.text = title;
    [_cTitleLabel sizeToFit];
}

@end
