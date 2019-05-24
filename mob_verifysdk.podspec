Pod::Spec.new do |s|
	s.name                = "mob_verifysdk"
	s.version             = "1.1.1"
	s.summary             = '云验证，秒登录，秒验证'
	s.license             = 'Copyright © 2018-2028 mob.com'
	s.author              = { "mob" => "mobproducts@163.com" }

	s.homepage            = 'http://www.mob.com'
	s.source              = { :git => "https://github.com/MobClub/MobVerify-For-iOS.git", :tag => s.version.to_s }
  	s.platform              = :ios
  	s.ios.deployment_target = "8.0"

	s.frameworks          = "AdSupport", "AddressBook", "SystemConfiguration", "CoreTelephony"
	s.libraries           = "icucore", "z", "c++"

	s.vendored_frameworks = 'SDK/MobVerify/MobVerify.framework',
							'SDK/MobVerify/options/account_verify_sdk_core.framework',
							'SDK/MobVerify/options/EAccountSDKNetwork.framework',
							'SDK/MobVerify/options/TYRZNoUISDK.framework'

	s.xcconfig  		  =  {'OTHER_LDFLAGS' => '-ObjC' }

	s.dependency 'MOBFoundation'
	s.dependency 'mob_smssdk'

    s.resources = 'SDK/MobVerify/MobVerify.bundle'


end
