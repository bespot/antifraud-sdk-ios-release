// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AntifraudSPM",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AntifraudSPM",
            type: .dynamic,
            targets: ["AntifraudSPM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bespot/sharedSPM.git", exact: "1.0.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AntifraudSPM",
            dependencies: [
                .target(name: "AntifraudSDK"),
                .product(name: "sharedSPM", package: "sharedSPM")
            ]
        ),
        .testTarget(
            name: "AntifraudSPMTests",
            dependencies: ["AntifraudSPM"]),
        .binaryTarget(
            name: "AntifraudSDK",
            url: "https://github.com/bespot/antifraud-sdk-ios-release/releases/download/1.0.6/AntifraudSDK.xcframework.zip",
            checksum: "8ed590973e38f04a7499e1921ea8dea2983fe847152d90ecacab4a8cc105adae")
    ]
)
