# Bespot Gatekeeper iOS SDK

[![VERSION](https://img.shields.io/badge/VERSION-1.1.1-green)](#)
[![Swift Version][swift-image]][swift-url]

Bespot Gatekeeper is a highly customizable fraud prevention and geolocation verification platform for mobile and web applications. It verifies user locations, detects device integrity issues, and monitors network connections to help organizations—particularly in the iGaming, Media Streaming, and Financial Services industries—comply with regulations and protect digital transactions from fraud.

## Features

See our [documentation](https://gatekeeper.docs.bespot.com/overview/features/) for an up-to-date list of fraud detections available across platforms.

## Requirements

- iOS 15.0+
- Xcode 16

## Install the library

### Install with Swift Package Manager
You can use [Swift Package Manager](https://github.com/swiftlang/swift-package-manager) to install *AntifraudSDK* following the [tutorial by Apple](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

1. In Xcode, select "File" -> "Add Package Dependencies..."
2. Enter [https://github.com/bespot/antifraud-sdk-ios-release.git](https://github.com/bespot/antifraud-sdk-ios-release.git)

or you can add the following dependency to your `Package.swift`:

```
.package(url: "https://github.com/bespot/antifraud-sdk-ios-release.git", exact: "1.1.1")
```

### Install with CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install *AntifraudSDK*. See steps below:

1. Add *AntifraudSDK* dependency to your *Podfile* - using the https git link|version. See sample code hereby:

```ruby
# Minimum supported iOS platform for AntifraudSDK
platform :ios, '15.0'

target '[Your app]' do
  # Needed for the project to use dynamic frameworks
  use_frameworks!

  # AntifraudSDK framework
  pod 'AntifraudSDK', :git => 'https://github.com/bespot/antifraud-sdk-ios-release', :tag => '1.1.1'

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

3. Open Xcode & update _linking_. Select you main project in the _Project Navigator_ -> Select each of the targets -> Go to _Build Settings_ view -> filter with `Other Linker Flags` on filtering text view at the top right -> Remove the following: `$(inherited)`, `-framework "AntifraudSDK"` and `-framework "shared"`.

4. Disable user script sandboxing in Project settings. Select you main project in the _Project Navigator_ -> Select the project (not the targets) -> Go to _Build Settings_ view -> filter with `ENABLE_USER_SCRIPT_SANDBOXING` on filtering text view at the top right -> Set it to `No`.


> [!NOTE]
>
> _When building your app in an **Intel** based Mac, set `12.0` instead of `15.0` as a deployment target in the build settings:_
>
> `config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'`


### Install Manually

For manually installing *AntifraudSDK* into your app, follow the steps below:

1. Download and drop `AntifraudSDK.xcframework` folder in your project (select "copy items if needed" in the popup menu).
2. Select "Embed & Sign" at the `AntifraudSDK.xcframework` listing in your application's Target General settings menu.


## Usage example

### Permissions

#### Access to location
AntifraudSDK needs access to device location to enable location-based checks. The following permission should be granted from the user in order for AntifraudSDK to work.

- __When In Use__ authorization (_"Allow While Using the App"_ option)

From [Apple developer documentation](https://developer.apple.com/documentation/corelocation/requesting-authorization-to-use-location-services#Provide-descriptions-of-how-you-use-location-services):

> _"The first time you make an authorization request, the system displays an alert asking the person to grant or deny the request. The alert includes a usage description string that explains why you want access to location data. You provide this string in your app’s Info.plist file and use it to inform people about how your app uses location data._

Provide the following key along with a usage description string in your app's `Info.plist` file:

- [NSLocationWhenInUseUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nslocationwheninuseusagedescription)

### Initialization

#### Import
Do the import:

```swift
import AntifraudSDK
```

#### Initialization
In your application's AppDelegate ```application(_:didFinishLaunchingWithOptions:)``` method add this line to initialize the SafeSDK singleton object:

```swift
SafeSDK.shared.initialize(apiKey: "the_provided_API_key",
                      apiBaseURL: "the_provided_API_base_URL",
                      authTokenUrl: "the_provided_oauth2_URL",
                      clientId: "the_provided_oauth2_clientid",
                      clientSecret: "the_provided_oauth2_clientsecret")
```

#### Parametrization
During initialization, use the params `[String: Any]` optional array for further configuration. Currently, configuration parameters available:
- Key: `"debugLoggingEnabled"`, Value: `Bool`. For enabling debug logging. Do not keep debug logging enabled in production builds.

```swift
SafeSDK.shared.initialize(apiKey: "the_provided_API_key",
                      apiBaseURL: "the_provided_API_base_URL",
                      authTokenUrl: "the_provided_oauth2_URL",
                      clientId: "the_provided_oauth2_clientid",
                      clientSecret: "the_provided_oauth2_clientsecret",
                      params: ["debugLoggingEnabled": true])
```


#### Security
OAuth 2.0 client credentials provided (*client id* & *client secret*) should be used in a safe and secure manner. It is strongly advised **not** to be part of the application bundle when submitting to the App Store.

#### Delegation
Use the _optional_ `InitializationDelegate` delegate in case you need to be informed for a successful or unsuccessful SafeSDK initialization. In your view controller's ```viewDidLoad``` method add this:
```swift
SafeSDK.shared.initializationDelegate = self
```

Extend your view controller to implement the _optional_ delegate methods:
```swift
extension YourViewController: SafeSDK.InitializationDelegate {
   func initializationSucceeded() {
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

### Identify user (SetUserId)
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
© 2025 [Bespot](https://bespot.com/) Private Company. All rights reserved. See `LICENSE` for more information.


[swift-image]: https://img.shields.io/badge/swift-6.1-orange.svg
[swift-url]: https://swift.org/
