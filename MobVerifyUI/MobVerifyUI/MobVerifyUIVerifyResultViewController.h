//
//  MobVerifyUIVerifyResultViewController.h
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobVerifyUIBaseViewController.h"



@class MobVerifyUIResultConfig;

/**
 * @brief 验证结果ViewController v1.0.0
 */
@interface MobVerifyUIVerifyResultViewController : MobVerifyUIBaseViewController


/**
 *  @from                    v1.0.0
 *  @brief                   初始化
 *
 *  @param config            结果配置信息
 *  @param result            结果回调
 */
- (instancetype)initWithConfig:(MobVerifyUIResultConfig *)resultConfig compeletion:(MobVerifyUICommonResult)result;

@end

