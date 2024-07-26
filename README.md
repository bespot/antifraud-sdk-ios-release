# Antifraud SDK iOS - Release

[![VERSION](https://img.shields.io/badge/VERSION-0.0.1-green)](#)
[![Swift Version][swift-image]][swift-url]

Antifraud SDK is an easy to use iOS library for protecting your application from fraudulent activities. Our SDK requires minimal permissions and uses device information and sensors to detect and report potential threats, so that app developers can make informed decisions about their application's actions.

## Detections

- [x] Geofencing: The device location is cross-checked based on predefined digital geofence.
- [x] Mock Location: The device location is received from an external accessory or generated using on-device software simulation.

## Requirements

- iOS 15.0+
- Xcode 15

## Installation

### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install *SafeSDK*. See steps below:

1. Add *SafeSDK* dependency to your *Podfile* - using the https git link|version. See sample code hereby:

```ruby
# Minimum supported iOS platform for SafeSDK
platform :ios, '15.0'

target '[Your app]' do
  # Needed for the project to use dynamic frameworks
  use_frameworks!

  # SafeSDK framework
  pod 'SafeSDK', :git => 'https://github.com/bespot/antifraud-sdk-ios-release', :tag => '0.0.1'

  # Other CocoaPods libraries/frameworks you may use...

end

# Use the following block to ensure all dependencies are using the same deployment target version
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
```

2. Run `pod install`

> [!NOTE]
>
> _When building your app in an **Intel** based Mac, set `12.0` instead of `15.0` as a deployment target in the build settings:_
>
> `config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'`



### Manually

For manually installing *SafeSDK* into your app, follow the steps below:

1. Download and drop ```SafeSDK.xcframework``` folder in your project (select "copy items if needed" in the popup menu).
2. Select "Embed & Sign" at the SafeSDK.xcframework listing in your application's Target General settings menu (Xcode 15)

## Usage example

### Permissions

#### Access to location
SafeSDK needs access to device location to enable location-based checks. The following permission should be granted from the user in order for SafeSDK to work.

- __When In Use__ authorization (_"Allow While Using the App"_ option)

From [Apple developer documentation](https://developer.apple.com/documentation/corelocation/requesting-authorization-to-use-location-services#Provide-descriptions-of-how-you-use-location-services):

> _"The first time you make an authorization request, the system displays an alert asking the person to grant or deny the request. The alert includes a usage description string that explains why you want access to location data. You provide this string in your app’s Info.plist file and use it to inform people about how your app uses location data._

Provide the following key along with a usage description string in your app's `Info.plist` file:

- [NSLocationWhenInUseUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nslocationwheninuseusagedescription)

### Initialization

Do the import:

```swift
import SafeSDK
```

In your application's AppDelegate ```application(_:didFinishLaunchingWithOptions:)``` method add this line to initialize the SafeSDK singleton object:

```swift
SafeSDK.shared.initialize(apiKey: "the_provided_API_key",
                      apiBaseURL: "the_provided_API_base_URL")
```

Use the _optional_ `InitializationDelegate` delegate in case you need to be informed for a successful or unsuccessful SafeSDK initialization. In your view controller's ```viewDidLoad``` method add this:
```swift
SafeSDK.shared.initializationDelegate = self
```

Extend your view controller to implement the optional delegate methods:
```swift
extension YourViewController: SafeSDK.InitializationDelegate {
   func initializationSucceded() {
     // TODO: Continue your work
   }

   func initializationFailed(error: SDKError) {
     // TODO: Troubleshoot the error
   }
}
```

### On-demand check
Use the following method to make an informed decision on what action to take in case of detected fraudulent activities by SafeSDK:

```swift
SafeSDK.shared.check { result in
    switch result {
    case .success(let action):
        // TODO: Use proposed action of the SafeSDK
    case .failure(let error):
        // TODO: Troubleshoot the error
    }
}
```

The above asynchronous method, triggers checks and returns a closure containing a result object: `Result<Action, SDKError>`.

Result actions have one of the following types:
```swift
public enum ActionType {
    case block,
    case limitAccess,
    case monitor,
    case notSafe,
    case safe
}
```

### Set the user identifier
After initialization is completed, SafeSDK supports holding a customer/client related unique user identifier which can be provided at any time using the following method:

```swift
SafeSDK.shared.setUserId("client_user_identifier")
```

## App Store Connect distribution
We collect application version and build number information for debugging and analytics purposes. Xcode 13 has added an option **"Manage Version and Build Number"** during the process of app distribution. Please be sure to have this option **disabled** in order for SDK versions to be correctly reported.
For Xcode 15, after creating the archive file and select Distribute App button, in the next screen you should select the Custom option. Finally you should deselect the option "Manage Version and Build Number" in order for SDK versions to be correctly reported.

## Support

We use [Github](https://github.com/bespot/antifraud-sdk-ios-release/issues) issues to track bugs and enhancements.

- If you find a bug please fill out an issue report. Provide as much information as possible.
- If you think of a great idea please fill out an issue as a proposal for your idea.

In case you need to contact us, drop us an email at: dev@bespot.com


## License

(C) Copyright 2020-2024 Bespot P.C. All rights reserved. See `LICENSE` for more information.
[Bespot](https://bespot.com/) Location tracking to drive growth, profitability and customer engagement


[swift-image]: https://img.shields.io/badge/swift-5.9-orange.svg
[swift-url]: https://swift.org/
