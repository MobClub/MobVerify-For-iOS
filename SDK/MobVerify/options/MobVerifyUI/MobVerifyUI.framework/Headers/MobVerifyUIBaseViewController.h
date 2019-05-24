//
//  MobVerifyUIBaseViewController.h
//  MobAuthDemo
//
//  Created by hower on 2018/12/25.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobVerifyUIConfigs.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @brief 视图基类(base viewController) v1.0.0
 */
@interface MobVerifyUIBaseViewController : UIViewController

/**
 *  @from                    v1.0.0
 *  @brief                   加载配置
 *
 *  @param config            配置信息
 */
- (void) loadConfig:(MobVerifyUIBaseConfig *)config;

/**
 *  @from                    v1.0.0
 *  @brief                   加载配置
 *
 *  @param config            配置信息
 */
- (void) setCustomTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
