//
//  MobVerifyUIConfigs.h
//  MobAuthDemo
//
//  Created by hower on 2018/12/27.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  显示 UI风格
 */
typedef NS_ENUM(NSInteger, MobVerifyUIShowStyle)  {
    MobVerifyUIShowStylePush     = 0,    // push
    MobVerifyUIShowStylePresent     = 1,    // present
};

/**
 *  基础配置
 */
@interface MobVerifyUIBaseConfig : NSObject

/**
 *  设置导航标题
 */
@property (strong, nonatomic) NSString *navTitle;

/**
 *  设置导航标题颜色
 */
@property (strong, nonatomic) UIColor *navTitleColor;

/**
 *  设置导航tintColor
 */
@property (strong, nonatomic) UIColor *navTintColor;

/**
 *  设置导航背景颜色
 */
@property (strong, nonatomic) UIColor *navBackgroundColor;

/**
 *  设置导航背景图片
 */
@property (strong, nonatomic) UIImage *navBackgroundImage;

/**
 *  设置导航自定义标题视图
 */
@property (strong, nonatomic) UIView *navCustomTitleView;


/**
 *  设置导航标题字体
 */
@property (strong, nonatomic) UIFont *navTitleFont;

/**
 *  确定按钮标题
 */
@property (strong, nonatomic) NSString *submitTitle;

/**
 *  确定按钮标题颜色
 */
@property (strong, nonatomic) UIColor *submitTitleColor;

/**
 *  确定按钮标题字体
 */
@property (strong, nonatomic) UIFont *submitTitleFont;

/**
 *  确定按钮背景色
 */
@property (strong, nonatomic) UIColor *submitBgColor;

/**
 *  确定按钮背景图片
 */
@property (strong, nonatomic) UIImage *submitBackgroundImage;

/**
 *  确定按钮圆角
 */
@property (assign, nonatomic) CGFloat cornerRadius;

@end

/**
 *  验证界面配置
 */
@interface MobVerifyUIVerifyConfig : MobVerifyUIBaseConfig

/**
 *  模板id
 */
@property (strong, nonatomic) NSString *tmpCode;

/**
 *  号码标题
 */
@property (strong, nonatomic) NSString *localTitle;

/**
 *  号码标题颜色
 */
@property (strong, nonatomic) UIColor *localTitleColor;

/**
 *  号码标题字体
 */
@property (strong, nonatomic) UIFont *localTitleFont;


/**
 *  输入号码placeholder
 */
@property (strong, nonatomic) NSString *phonePlaceholder;

/**
 *  输入号码字体
 */
@property (strong, nonatomic) UIFont *phoneFont;


/**
 *  底部横线颜色
 */
@property (strong, nonatomic) UIColor *bottomLineColor;

/**
 *  描述内容
 */
@property (strong, nonatomic) NSString *des;

/**
 *  描述内容颜色
 */
@property (strong, nonatomic) UIColor *desColor;

/**
 *  描述内容字体
 */
@property (strong, nonatomic) UIFont *desFont;

@end


/**
 *  验证结果配置
 */
@interface MobVerifyUIResultConfig : MobVerifyUIBaseConfig


/**
 *  状态图片
 */
@property (strong, nonatomic) UIImage *stateImage;

/**
 *  状态标题
 */
@property (strong, nonatomic) NSString *stateTitle;

/**
 *  状态标题颜色
 */
@property (strong, nonatomic) UIColor *stateTitleColor;

/**
 *  状态标题字体
 */
@property (strong, nonatomic) UIFont *stateTitleFont;

/**
 *  描述内容
 */
@property (strong, nonatomic) NSString *des;

/**
 *  描述内容颜色
 */
@property (strong, nonatomic) UIColor *desColor;

/**
 *  描述内容字体
 */
@property (strong, nonatomic) UIFont *desFont;

@end


/**
 *  验证码界面配置
 */
@interface MobVerifyUICodeVerifyConfig : MobVerifyUIBaseConfig

/**
 *  模板id
 */
@property (strong, nonatomic) NSString *tmpCode;

/**
 *  失败图片
 */
@property (strong, nonatomic) UIImage *failImage;

/**
 *  状态标题
 */
@property (strong, nonatomic) NSString *stateTitle;

/**
 *  失败描述颜色
 */
@property (strong, nonatomic) UIColor *stateTitleColor;

/**
 *  失败描述字体
 */
@property (strong, nonatomic) UIFont *stateTitleFont;

/**
 *  失败描述
 */
@property (strong, nonatomic) NSString *failDesTitle;

/**
 *  失败描述颜色
 */
@property (strong, nonatomic) UIColor *failDesColor;

/**
 *  失败描述字体
 */
@property (strong, nonatomic) UIFont *failDesFont;



/**
 *  顶部横线颜色
 */
@property (strong, nonatomic) UIColor *topLineColor;


/**
 *  号码标题
 */
@property (strong, nonatomic) NSString *localTitle;

/**
 *  号码标题颜色
 */
@property (strong, nonatomic) UIColor *localTitleColor;

/**
 *  号码标题字体
 */
@property (strong, nonatomic) UIFont *localTitleFont;


/**
 *  输入号码placeholder
 */
@property (strong, nonatomic) NSString *phonePlaceholder;

/**
 *  输入号码字体
 */
@property (strong, nonatomic) UIFont *phoneFont;


/**
 *  底部横线颜色
 */
@property (strong, nonatomic) UIColor *bottomLineColor;

/**
 *  描述内容
 */
@property (strong, nonatomic) NSString *des;

/**
 *  描述内容颜色
 */
@property (strong, nonatomic) UIColor *desColor;

/**
 *  描述内容字体
 */
@property (strong, nonatomic) UIFont *desFont;
@end


/**
 *  sdk 配置
 */
@interface MobVerifyUIConfig : NSObject


/**
 * UI显示风格
 */
@property (nonatomic, assign)MobVerifyUIShowStyle showStyle;


/**
 * app入口 UIViewController
 */
@property (nonatomic, weak) UIViewController *rootViewController;


/**
 * 验证界面配置
 */
@property (nonatomic, strong) MobVerifyUIVerifyConfig *verifyConfig;

/**
 * 验证结果配置
 */
@property (nonatomic, strong) MobVerifyUIResultConfig *resultConfig;

/**
 * 验证码配置
 */
@property (nonatomic, strong) MobVerifyUICodeVerifyConfig *codeVerifyConfig;

@end

