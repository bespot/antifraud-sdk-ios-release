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
            url: "https://github.com/bespot/antifraud-sdk-ios-release/releases/download/1.2.0-test/AntifraudSDK.xcframework.zip",
            checksum: "77f697cca5f4641f910bfd3ae84a019a69c71d0eeafec84005635789bdc5cf51"
        )
    ]
)
