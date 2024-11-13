Pod::Spec.new do |spec|

  spec.name         = "AntifraudSDK"
  spec.version      = "0.5.3"
  spec.summary      = "Bespot SAFE fraud prevention platform."
  spec.description  = <<-DESC
  Bespot SAFE is a highly customisable online-fraud prevention solution that detects suspicious activities is the dependency in mobile and web applications.
                   DESC
  spec.homepage     = "https://github.com/bespot/antifraud-sdk-ios-release"
  spec.license      = "MIT"
  spec.authors            = { "Konstantinos Dimitros" => "k.dimitros@bespot.com", "spvagelis" => "spirou.vagelis@gmail.com" }
  spec.platform = :ios, "15.0"
  spec.ios.vendored_frameworks = 'AntifraudSDK.xcframework', 'shared.xcframework'
  spec.swift_version = "5.9"
  spec.source = { :http => "file:" + __dir__}
  spec.dependency 'CocoaLumberjack/Swift'
  spec.dependency 'PaperTrailLumberjack/Swift'

end
