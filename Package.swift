// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusAdMobAdapter",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "TradPlusAdMobAdapter",
            targets: ["TradPlusAdMobAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.17.0")
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            .exact("13.11.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusAdMobAdapter",
            dependencies: [
                .target(name: "TPAdMobAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: ".",
            sources: ["Sources/TradPlusAdMobAdapter/TradPlusAdMobAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPAdMobAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AdMob/releases/download/15.17.0/TPAdMobAdapter-15.17.0.xcframework.zip",
            checksum: "0c0e3c550bee830ae29a99d32970773ce38244ceeea9a8e541cbaaaea60ddacd"
        ),
    ]
)
