//
//  MobVerifyUIContext.m
//  MobAuthDemo
//
//  Created by hower on 2018/12/26.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MobVerifyUIContext.h"

@implementation MobVerifyUIContext

+ (MobVerifyUIContext *)defaultContext
{
    static MobVerifyUIContext *_instance = nil;
    static dispatch_once_t defaultContextPredicate;
    dispatch_once(&defaultContextPredicate, ^{
        _instance = [[MobVerifyUIContext alloc] init];
    });
    
    return _instance;
}
@end
