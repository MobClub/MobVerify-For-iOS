//
//  EAccountSDK.h
//  EAccountSDKNetwork
//
//  Created by thy on 2018/6/23.
//  Copyright © 2018年 21CN. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 声明一个block
 @param resultDic 网络返回的data的解析结果
 */
typedef   void (^successHandler) ( NSDictionary * _Nonnull resultDic);

/**
 声明一个block
 @param error 网络返回的错误或者其它错误
 */
typedef   void (^failureHandler) (NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface EAccountSDK : NSObject

/**
 初始化SDK
 
 @param appKey 接入方在账号平台领取的appKey
 @param appSecrect 接入方在账号平台领取的appSecrect
 */
+ (void)initWithSelfKey:(NSString *)appKey
              appSecret:(NSString *)appSecrect;

/**
*@description 预取号获取accessCode
*@param timeoutInterval 接口超时时间
*@param bussinessType 业务类型，号码校验(传@"jy")
*/
+ (void)getMobileCodeWithBussinessType:(NSString*)bussinessType
      timeoutInterval:(NSTimeInterval)timeoutInterval
           completion:(nonnull successHandler)completion
              failure:(nonnull failureHandler)fail;



@end

NS_ASSUME_NONNULL_END
