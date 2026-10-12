// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "appinio_social_share",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "appinio-social-share", targets: ["appinio_social_share"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // Matches the podspec (FBSDKCoreKit / FBSDKShareKit ~> 18.0) so a consuming
        // app resolves a single facebook-ios-sdk alongside flutter_facebook_auth
        // (18.0.2 ..< 19.0.0).
        .package(url: "https://github.com/facebook/facebook-ios-sdk", from: "18.0.2")
    ],
    targets: [
        .target(
            name: "appinio_social_share",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "FacebookShare", package: "facebook-ios-sdk")
            ]
        )
    ]
)
