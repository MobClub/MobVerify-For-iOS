Pod::Spec.new do |s|
	s.name                = "mob_verifysdk"
	s.version             = "1.0.0"
	s.summary             = '云验证，秒登录，秒验证'
	s.license             = 'Copyright © 2018-2028 mob.com'
	s.author              = { "mob" => "mobproducts@163.com" }

	s.homepage            = 'http://www.mob.com'
	s.source              = { :git => "https://github.com/MobClub/MobVerify-For-iOS.git", :tag => s.version.to_s }
  	s.platform              = :ios
  	s.ios.deployment_target = "8.0"

	s.frameworks          = "AdSupport", "AddressBook.framework", "SystemConfiguration.framework", "CoreTelephony.framework"
	s.libraries           = "icucore", "z", "c++"

	s.vendored_frameworks = 'SDK/MobVerify/MobVerify.framework',
							'SDK/Required/account_verify_sdk_core.framework',
							'SDK/Required/EAccountSDKNetwork.framework',
							'SDK/Required/TYRZNoUISDK.framework'

	s.xcconfig  		  =  {'OTHER_LDFLAGS' => '-ObjC' }

	s.dependency 'MOBFoundation'
	s.dependency 'mob_smssdk'


end
