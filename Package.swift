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
            .exact("15.12.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AdMob/releases/download/15.12.0/TPAdMobAdapter-15.12.0.xcframework.zip",
            checksum: "8d8a7aa44d51742e4b997f300a4d92476c7b27598f66bde9ce31beddd4c4cc36"
        ),
    ]
)
