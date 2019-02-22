//
//  MobVerifyUI.m
//  MobAuthDemo
//
//  Created by hower on 2018/12/26.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobVerifyUI.h"
#import "MobVerifyUIVerifyViewController.h"
#import "MobVerifyUIContext.h"


@implementation MobVerifyUI

+ (void)verifyWithConfig:(MobVerifyUIConfig *)config result:(MobVerifyUIVerifyResult)result
{
    if(!config.rootViewController || ![config.rootViewController isKindOfClass:[UIViewController class]])
    {
        MobVerifyUILog(@"%@",MobVerifyUILocalized(@"rootViewControllererror"));
        if(result)
        {
            result([NSError errorWithDomain:@"com.mob.MobVerifyUI" code:0 userInfo:@{@"description":MobVerifyUILocalized(@"rootViewControllererror")}]);
        }
        return;
    }
    
    //取数据
    MobVerifyUIContext *context = [MobVerifyUIContext defaultContext];
    context.verifyConfig = config.verifyConfig;
    context.resultConfig = config.resultConfig;
    context.codeVerifyConfig = config.codeVerifyConfig;
    context.rootVC = config.rootViewController;
    
    //校验vc
    if(config.showStyle == MobVerifyUIShowStylePush && context.rootVC.navigationController)
    {
        MobVerifyUIVerifyViewController *phoneVc = [[MobVerifyUIVerifyViewController alloc] initWithConfig:context.verifyConfig compeletion:^(NSError *error) {
            if(result)
            {
                result(error);
            }
        }];
        [context.rootVC.navigationController pushViewController:phoneVc animated:YES];
    }
    else
    {
        MobVerifyUIVerifyViewController *phoneVc = [[MobVerifyUIVerifyViewController alloc] initWithConfig:context.verifyConfig compeletion:^(NSError *error) {
            
            if(result)
            {
                result(error);
            }
        }];
        UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:phoneVc];
        [context.rootVC presentViewController:navVc animated:YES completion:nil];
    }
    
}

@end
