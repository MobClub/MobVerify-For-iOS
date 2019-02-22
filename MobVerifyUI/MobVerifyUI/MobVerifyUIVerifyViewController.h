//
//  MobVerifyUIVerifyViewController.h
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobVerifyUIBaseViewController.h"



@class MobVerifyUIVerifyConfig;

/**
 * @brief 验证ViewController v1.0.0
 */
@interface MobVerifyUIVerifyViewController : MobVerifyUIBaseViewController

/**
 *  @from                    v1.0.0
 *  @brief                   初始化
 *
 *  @param config            验证配置信息
 *  @param result            验证结果回调(Results of the Verification)
 */
- (instancetype)initWithConfig:(MobVerifyUIVerifyConfig *)verifyConfig compeletion:(MobVerifyUICommonResult)result;

@end
