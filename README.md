# MobVerify For iOS
### [MobVerify](http://wiki.mob.com/mob云验证-for-ios/),快速实现登录，注册，验证功能

**当前版本**

- iOS v0.0.1

**集成文档**

- [iOS](http://wiki.mob.com/mobsdk/)

--------

## 一、获取AppKey 与短信模板Id
1. 打开[Mob官网](http://mob.com/)，在官网首页选择登录或注册，新用户先注册，老用户直接登录。
	
	![mob_home](http://wiki.mob.com/wp-content/uploads/2018/10/76B2999E-274D-4E03-8E64-5B1623879EDE.png)

	注册页面如下图：
	
	![mob_reg](http://wiki.mob.com/wp-content/uploads/2017/12/QQ234.png)

2. 注册或登录完成后，会返回至首页，点击右上角的 “进入后台” ，会跳转至管理后台，点击 “添加应用”。如下图：

	![Snip20170612_9](http://wiki.mob.com/wp-content/uploads/2019/02/D6D65AA1-3332-48A4-85CD-55A4663057DF.png)
	
	输入应用名称后点击 **“保存”** ，如下图：
	
	![mob_create_app](http://wiki.mob.com/wp-content/uploads/2019/02/03C5FA8D-C429-41CF-A163-291D7B0F038D.png)
	
	点击添加的应用 ，如下图：
	
	![mob_add_product](http://wiki.mob.com/wp-content/uploads/2019/02/AAE69D25-C9FB-4AD2-A514-B7333EB4BEA4.png)
	
	点击应用下的Mob云验证，如下图：
	
	![mob_start](http://wiki.mob.com/wp-content/uploads/2019/02/7F734CFA-9A3A-4793-98D7-C485F1E7C301.png)
	
	点击确认添加，如下图：
	
	![mob_appkey](http://wiki.mob.com/wp-content/uploads/2019/02/8DE9BC36-762B-4310-83A6-B532FBCE1F44.png)

    再次点击左侧Mob云验证，如下图：

  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/297D35F6-7B6B-4FC1-8126-E74710E6D373.png)
  
  	点击概况就可以获取Appkey,App Secret ，如下图：
	
 ![mob_create_app](http://wiki.mob.com/wp-content/uploads/2019/02/6E6F658C-26BF-46C8-B1A3-90663EA6DF92.png)
	

3. 上线登记。

 	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/70C91A93-CE12-400F-8A00-F94B838E72D7.png)
 选择ipa包如下图：
 	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/55AA6215-4CC3-46E4-A890-06918B933F3F.png)
 
 审核通过
  	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/0807BEAD-96C3-4EBD-9544-316632B211B4.png)
  	  
4. 获取短信模板id
  	  
  	  综合设置
  	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/4F42B084-B7DA-462F-91F6-92B26A2AAE43.png)
  	  
  	  申请短信签名
  	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/A14CC615-5C07-4074-B57A-25D75CD059D6.png)
  	  
  	  填写短信签名信息
  	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/B0AA020A-E1B2-41A4-AE38-180DA4F4EADC.png)
  	  
  	 ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/5A2AE596-190E-4E6B-A29F-08D4F352417C.png)
  	 
  	 添加短信模板
	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/F028896C-D452-4E16-8289-1B8FA4FF3FF8.png)
	  	 
  	 输入短信模板信息
	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/1C4DE473-B8CF-431C-9189-D62836D27A85.png) 
	  
   最终获取短信模板id
	  ![mob_conf](http://wiki.mob.com/wp-content/uploads/2019/02/A2E50707-E10C-473A-AE96-D1F473314B8B.png) 

## 二、集成MobVerifySDK

### (1).使用CocoaPods自动集成

通过CocoaPods进行安装，只需在Podfile文件中添加：
	```
	   pod ‘mob_verifysdk’
	```


### 2.手动集成

1.请从官网[下载客户端SDK](http://mob.com/)，解压后可得到如下文件夹目录：

![Snip20170525_2](http://wiki.mob.com/wp-content/uploads/2019/02/C148F3E2-E7F1-414E-8787-7DB6694D3D25.png)


> **目录说明:：**

> * **Sample文件夹 云验证演示demo（供使用参考）**

> * **SDK下的MobVerify 存放MobVerify.framework-核心功能库(必须)**

> * **SDK下的Required 存放必要依赖库(必须)**

> * SDK 下的MobVerifyUI  为UI库(可选)

2.将SDK添加到项目中


（1）添加
    ![Snip20170525_2](http://wiki.mob.com/wp-content/uploads/2019/02/69D6CC47-432B-462A-8BEA-4F313C258C16.png)
    （2）文件夹复制
    ![Snip20170525_2](http://wiki.mob.com/wp-content/uploads/2019/02/DE46CC8B-35D3-43CE-BF8A-CA2504773B01.png)
    
 (3) 添加依赖库
 
*  libz.tbd
*  libicucore.tbd
*  libc++.tbd
*  AdSupport.framework
*  CoreTelephony.framework
*  SystemConfiguration.framework
*  AddressBook.framework

(4) 添加-ObjC
在Xcode中找到TARGETS–>Build Setting–>Linking–>Other Linker Flags 在这选项中需要添加 -ObjC

![Snip20170525_2](http://wiki.mob.com/wp-content/uploads/2019/02/25F5D352-8B34-40F8-BAB6-186492A25D28.png)


## 三、集成MobVerify的初始化配置和功能接口


1. 配置MOBAppKey和MOBAppSecret
在项目的Info.plist中添加2个字段：MOBAppKey和MOBAppSecret，对应的值是在mob.com官方申请的应用的AppKey和AppSecret。


	![Snip20170525_4](http://wiki.mob.com/wp-content/uploads/2019/02/83B56B51-CC43-4CED-BA0C-B306F4C31F5B.png)
	

2. 接口调用

	i. 云验证接口
```
	#import <MobVerify/MobVerify.h>
 [MobVerify cloudVerifyWithPhoneNumber:@"18588558175" zone:@"86" template:@"1319972" result:^(NSError *error) {
        if(!error)
        {
           //验证成功
        }
        else
        {
            //验证不通过，启用了短信验证，弹出短信验证的界面处理相关逻辑
            if(error.code == 6119003)
            {              
            }
            else
            {
               //验证失败
            }            
        }
    }];
```

	ii. 云验证接口
```
	#import <MobVerify/MobVerify.h>
[MobVerify verifyWithCode:@"4502" phoneNumber:@"18588558175" zone:@"86" result:^(NSError *error) {
        if(!error)
        {
           //验证成功
        }
        else
        {
           //验证失败
       }
    }];
    ```

	
## 三、特殊说明

1. 当使用https是需要配置domain

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>NSExceptionDomains</key>
	<dict>
		<key>id6.me</key>
		<dict>
			<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
			<true/>
		</dict>
	</dict>
	<key>NSAllowsArbitraryLoads</key>
	<false/>
</dict>
</plist>
```




