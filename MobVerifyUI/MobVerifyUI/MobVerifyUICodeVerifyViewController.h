//
//  MobVerifyUICommitCodeViewController.h
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobVerifyUIBaseViewController.h"



@class MobVerifyUICodeVerifyConfig;

/**
 * @brief 短信验证ViewController v1.0.0
 */
@interface MobVerifyUICodeVerifyViewController : MobVerifyUIBaseViewController



/**
 *  @from                    v1.0.0
 *  @brief                   初始化
 *
 *  @param config            短信验证配置信息
 *  @param result            短信验证回调
 */
- (instancetype)initWithConfig:(MobVerifyUICodeVerifyConfig *)codeConfig phoneNumber:(NSString *)phoneNumber zone:(NSString *)zone compeletion:(MobVerifyUICommonResult)result;

@end

