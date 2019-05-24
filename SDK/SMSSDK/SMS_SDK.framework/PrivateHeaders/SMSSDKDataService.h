//
//  WQUserDataManager.h
//  testKeyChain
//
//  Created by 掌淘科技 on 14-8-29.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MOBFoundation/MOBFoundation.h>

@interface SMSSDKDataService : NSObject

/**
 存储Token
 */
+ (void) saveToken:(NSString *)token;

/**
 读取Token
 */
+ (id) readToken;

/**
 存储Contactkey
 */
+ (void) saveContactkey:(NSString *)contactkey;

/**
 读取Contactkey
 */
+ (id) readContactkey;

/**
 保存配置数据
 */
+ (void) saveConfigDic:(NSDictionary *)configDic ;

/**
 读取配置数据
 */
+ (NSDictionary *) readConfigDic;

/**
 保存当前手机号
 */
+ (void) savePhoneAndZone;

/**
 读取手机号
 */
+ (NSString *) readPhoneNumber;

/**
 读取区号
 */
+ (NSString *) readCountryZone;

/**
 保存国家列表
 */
+ (void) saveCountryZoneList:(NSArray *)list;

/**
 读取国家列表
 */
+ (NSArray *) readCountryZoneList;

/**
 保存通讯录md5值
 */
+ (void) saveFlagOfContacts:(NSArray *)contacts ;

/**
 读取通讯录md5值
 */
+ (NSString *) readFlagOfContacts ;

/**
 保存每次请求的成功数
 */
+ (void) saveSuccessRequestTimeFlagWithInfo:(NSDictionary *)info;

/**
 读取上次请求的绝对时间，info为请求的配置信息
 */
+ (NSInteger) readTimeFlagWithInfo:(NSDictionary *)info;

@end
