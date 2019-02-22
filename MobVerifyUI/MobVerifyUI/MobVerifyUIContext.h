//
//  MobVerifyUIContext.h
//  MobAuthDemo
//
//  Created by hower on 2018/12/26.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MobVerifyUIVerifyConfig;
@class MobVerifyUIResultConfig;
@class MobVerifyUICodeVerifyConfig;


@interface MobVerifyUIContext : NSObject

/**
 *  获取默认上下文对象
 */
+ (MobVerifyUIContext *)defaultContext;

/**
 * 验证界面配置
 */
@property (nonatomic, strong) MobVerifyUIVerifyConfig *verifyConfig;

/**
 * 验证结果配置
 */
@property (nonatomic, strong) MobVerifyUIResultConfig *resultConfig;

/**
 * 验证码验证配置
 */
@property (nonatomic, strong) MobVerifyUICodeVerifyConfig *codeVerifyConfig;

/**
 * app 入口 UIViewController
 */
@property (nonatomic, weak) UIViewController *rootVC;


@end

