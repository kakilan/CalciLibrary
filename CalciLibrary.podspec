#
#  Be sure to run `pod spec lint CalciLibrary.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "CalciLibrary"
  spec.version      = "1.0.0"
  spec.summary      = "A Math calculation library"
  spec.description  = "CalciLibrary is a powerful library to calculate Math operations that can be used in any iOS app. Additionally it also supports to calculate realtime Bitcoin value and Reverse geocoded address when latitude and longitude are provided. Also possible to remotely configure the operators through Firebase console."
  spec.swift_versions   = "5.0"
  spec.license          = { type: 'MIT', file: 'LICENSE' }
  spec.author           = { "Akilan" => "akilankamal@gmail.com" }
  spec.platform         = :ios, "12.0"
  spec.homepage         = "http://raywenderlich.com"
  spec.source           = { :git => "https://github.com/kakilan/CalciLibrary.git", :tag => "1.0.0" }
  spec.source_files     = "CalciLibrary/**/*.swift"
  spec.requires_arc     = true
  spec.static_framework = true
  spec.resources        = "CalciLibrary/GoogleService-Info.plist"
  spec.dependency "Firebase", "~> 6.30.0"
  spec.dependency "Firebase/Analytics", "~> 6.30.0"
  spec.dependency "Firebase/Crashlytics", "~> 6.30.0"
  spec.dependency "Firebase/RemoteConfig", "~> 6.30.0"

end
