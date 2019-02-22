//
//  ViewController.m
//  MobVerifyDemo
//
//  Created by hower on 2018/12/28.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "ViewController.h"
#import <MobVerifyUI/MobVerifyUI.h>
#import <MobVerify/MobVerify.h>
#import <MOBFoundation/MOBFoundation.h>
#import <TYRZNoUISDK/TYRZLogin.h>

@interface ViewController ()


@property (nonatomic, weak) IBOutlet UIButton *loginBtn;
@property (nonatomic, weak) IBOutlet UILabel *secondVerifyBtn;
@property (nonatomic, weak) IBOutlet UILabel *imgBg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imgBg.layer.cornerRadius = 10;
    _imgBg.layer.masksToBounds = YES;
    
}

- (IBAction)startLoginVerify:(id)sender
{
    
    //验证sdk 配置
    MobVerifyUIConfig *config = [MobVerifyUIConfig new];
    config.showStyle = MobVerifyUIShowStylePush;
    config.rootViewController = self;
    
    //验证界面配置
    MobVerifyUIVerifyConfig *vConfig = [MobVerifyUIVerifyConfig new];
    vConfig.tmpCode = @"1319972";
    
    config.verifyConfig = vConfig;
    
    //请求验证
    [MobVerifyUI verifyWithConfig:config result:^(NSError *error) {
        
        NSLog(@"亲爱的朋友，你好!");
    }];
    
}

- (IBAction)startSecondVerify:(id)sender
{
    //验证sdk 配置
    MobVerifyUIConfig *config = [MobVerifyUIConfig new];
    config.showStyle = MobVerifyUIShowStylePush;
    config.rootViewController = self;
    
    //验证界面配置
    MobVerifyUIVerifyConfig *vConfig = [MobVerifyUIVerifyConfig new];
    vConfig.navTitle = @"二次验证";
    vConfig.submitTitle= @"验证";
    vConfig.tmpCode = @"1319972";
    
    //验证码界面配置
    MobVerifyUICodeVerifyConfig *cConfig = [MobVerifyUICodeVerifyConfig new];
    cConfig.navTitle = @"二次验证";
    cConfig.submitTitle= @"验证";

    
    //验证结果面配置
    MobVerifyUIResultConfig *rConfig = [MobVerifyUIResultConfig new];
    rConfig.navTitle = @"二次验证";
    
    config.verifyConfig = vConfig;
    config.codeVerifyConfig = cConfig;
    config.resultConfig = rConfig;
    
    //请求验证
    [MobVerifyUI verifyWithConfig:config result:^(NSError *error) {

        NSLog(@"亲爱的朋友，你好!");
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
