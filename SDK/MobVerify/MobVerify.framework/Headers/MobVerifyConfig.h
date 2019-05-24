//
//  MobVerifyConfig.h
//  MobVerify
//
//  Created by hower on 2019/4/24.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @brief 配置类（Configuration class）v1.1.0
 */

@interface MobVerifyConfig : NSObject

/**
 * 一键登录的入口 UIViewController
 */
@property (nonatomic, weak) UIViewController *rootViewController;

/**
 * 短信模板号
 */
@property (nonatomic, strong) NSString *tmpCode;

@end
