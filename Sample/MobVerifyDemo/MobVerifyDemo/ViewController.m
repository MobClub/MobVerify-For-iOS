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
#import <MobVerify/MobVerifyConfig.h>
#import <MobVerifyUI/MobVerifyUIVerifyResultViewController.h>


#define MobVerifyDemoAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]


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

    
    MobVerifyConfig *config = [[MobVerifyConfig alloc] init];
    config.rootViewController = self;
    //config.tmpCode = @"1319972";
    
    [MobVerify loginWithConfig:config result:^(NSDictionary *resultData, NSError *error) {
        
        if(error)
        {
            if(error.code == 6119263)
            {
                //取消
                MobVerifyDemoAlert(@"取消一键登录");
            }
            else
            {
                MobVerifyDemoAlert(@"%@", error.description);
            }
        }
        else
        {
            //验证结果面配置
            MobVerifyUIResultConfig *rConfig = [MobVerifyUIResultConfig new];
            rConfig.navTitle = @"一键登录";
            
            MobVerifyUIVerifyResultViewController *vc = [[MobVerifyUIVerifyResultViewController alloc] initWithConfig:rConfig compeletion:nil];
            UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
            
            [self presentViewController:navVC animated:YES completion:nil];

        }
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
    vConfig.navTitle = @"本机号码验证";
    vConfig.submitTitle= @"验证";
    vConfig.tmpCode = @"1319972";
    //@"1319972";
    
    //验证码界面配置
    MobVerifyUICodeVerifyConfig *cConfig = [MobVerifyUICodeVerifyConfig new];
    cConfig.navTitle = @"本机号码验证";
    cConfig.submitTitle= @"验证";

    
    //验证结果面配置
    MobVerifyUIResultConfig *rConfig = [MobVerifyUIResultConfig new];
    rConfig.navTitle = @"本机号码验证";
    
    config.verifyConfig = vConfig;
    config.codeVerifyConfig = cConfig;
    config.resultConfig = rConfig;
    
    //请求验证
    [MobVerifyUI verifyWithConfig:config result:^(NSError *error) {

        //NSLog(@"亲爱的朋友，你好! %@", error?error.description:@"");
        MobVerifyDemoAlert(@"%@", error?error.description:@"亲爱的朋友，你好! ");
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
