//
//  MobVerify.h
//  MobVerify
//
//  Created by hower on 2018/12/28.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobVerifyDefine.h"


/**
 * @brief 验证类（Verify class）v1.0.0
 */
@interface MobVerify : NSObject


/**
 *  @from                    v1.0.0
 *  @brief                   云验证(cloud verify)
 *
 *  @param phoneNumber       电话号码(phoneNumber)
 *  @param zone              区域号，不要加"+"号(Area code)
 *  @param tmpCode           模板id(template id)
 *  @param result            验证结果回调(Results of the Verification)
 */
+ (void) cloudVerifyWithPhoneNumber:(NSString *)phoneNumber
                          zone:(NSString *)zone
                      template:(NSString *)tmpCode
                        result:(MobVerifyVerifyResult)result;



/**
 *  @from                    v1.0.0
 *  @brief                   验证码验证(verify)
 *
 *  @param code              验证码(code)
 *  @param phoneNumber       电话号码(phoneNumber)
 *  @param zone              区域号，不要加"+"号(Area code)
 *  @param result            验证结果回调(Results of the Verification)
 */
+ (void) verifyWithCode:(NSString *)code
            phoneNumber:(NSString *)phoneNumber
                   zone:(NSString *)zone
                 result:(MobVerifyCodeVerifyResult)result;

/**
 * @from                    v1.0.0
 * @brief                   SDK版本号(the version number of this SDK)
 * @return                  返回SDK版本号(Return the version number of this SDK)
 */
+ (NSString *) sdkVersion;

@end
