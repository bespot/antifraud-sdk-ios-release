Pod::Spec.new do |spec|

  spec.name         = "AntifraudSDK"
  spec.version      = "1.1.1"
  spec.summary      = "Bespot SAFE fraud prevention platform."
  spec.description  = <<-DESC
  Bespot SAFE is a highly customisable online-fraud prevention solution that detects suspicious activities is the dependency in mobile and web applications.
                   DESC
  spec.homepage     = "https://github.com/bespot/antifraud-sdk-ios-release"
  spec.license      = "MIT"
  spec.authors            = { "Konstantinos Dimitros" => "k.dimitros@bespot.com", "Vangelis Spyrou" => "e.spirou@bespot.com" }
  spec.platform = :ios, "15.0"
  spec.ios.vendored_frameworks = 'Binaries/AntifraudSDK.xcframework'
  spec.swift_version = "6.1"
  spec.source = { :http => "file:" + __dir__}

end
