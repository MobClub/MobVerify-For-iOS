//
//  MobVerifyUIProcessHUD.h
//  MobAuthDemo
//
//  Created by hower on 2018/12/25.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MobVerifyUIProcessHUD : NSObject

+ (void) showSuccessInfo:(NSString *)info;

+ (void) showFailInfo:(NSString *)info;

+ (void) showProcessHUDWithInfo:(NSString *)info;

+ (void) showMsgHUDWithInfo:(NSString *)info;


+ (void) dismiss;

+ (void) dismissWithResult:(void (^)())result;

+ (void) dismissWithDelay:(NSTimeInterval)second result:(void(^)())result;

@end

NS_ASSUME_NONNULL_END
