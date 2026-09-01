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
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            .exact("13.6.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AdMob/releases/download/15.14.0/TPAdMobAdapter-15.14.0.xcframework.zip",
            checksum: "45e4a8aceb1c6d338bfffd936d75c5fee7961af57b50c088708bda201833cfdb"
        ),
    ]
)
