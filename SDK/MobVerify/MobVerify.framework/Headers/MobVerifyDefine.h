//
//  MobVerifyDefine.h
//  MobVerify
//
//  Created by hower on 2019/1/14.
//  Copyright © 2019年 mob. All rights reserved.
//

#ifndef MobVerifyDefine_h
#define MobVerifyDefine_h

/**
 * @brief 验证结果回调(Results of the Verification)
 */
typedef void(^MobVerifyVerifyResult)(NSError *error);

/**
 * @brief 验证码验证结果回调(Results of the Verification)
 */
typedef void(^MobVerifyCodeVerifyResult)(NSError *error);

#endif /* MobVerifyDefine_h */
