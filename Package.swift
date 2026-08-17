// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AntifraudSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AntifraudSDK",
            targets: ["AntifraudSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "AntifraudSDK",
            url: "https://github.com/bespot/antifraud-sdk-ios-release/releases/download/1.2.1-test/AntifraudSDK.xcframework.zip",
            checksum: "78e009f0842ca4ac4fe384e833558d0a8adcee0332dd0f496d1bb31d9b03c635"
        )
    ]
)
