//
//  MobVerifyUI.h
//  MobVerifyUI
//
//  Created by hower on 2018/12/24.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobVerifyUIConfigs.h"


/**
 * @brief 验证结果回调(Results of the Verification)
 */
typedef void(^MobVerifyUIVerifyResult)(NSError *error);


/**
 * @brief 验证UI类（Verify class）v1.0.0
 */
@interface MobVerifyUI : NSObject

/**
 *  @from                    v1.0.0
 *  @brief                   验证(verify)
 *
 *  @param config            配置信息(sdk Configuration)
 *  @param result            验证结果回调(Results of the Verification)
 */
+ (void) verifyWithConfig:(MobVerifyUIConfig *)config result:(MobVerifyUIVerifyResult)result;



@end

