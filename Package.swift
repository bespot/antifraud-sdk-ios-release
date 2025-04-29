// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AntifraudSDK",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AntifraudSDK",
            targets: ["AntifraudSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .testTarget(
            name: "AntifraudSDKTests",
            dependencies: ["AntifraudSDK"]),
        .binaryTarget(
            name: "AntifraudSDK",
            url: "https://github.com/bespot/antifraud-sdk-ios-release/releases/download/1.1.0/AntifraudSDK.xcframework.zip",
            checksum: "b13f3d5930dd801466150cd98ce549925ed527678d03fdd25d7d560f1bd032d9"
        )
    ]
)

