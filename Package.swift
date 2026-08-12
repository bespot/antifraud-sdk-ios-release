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
            url: "https://github.com/bespot/antifraud-sdk-ios-release/releases/download/1.2.0/AntifraudSDK.xcframework.zip",
            checksum: "c33532a29133f6ae4b400ab4dceaf7fb166779ead65009cc50753eaa8c67db74"
        )
    ]
)
