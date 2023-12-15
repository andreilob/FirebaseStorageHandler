// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseStorageHandler",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "FirebaseStorageHandler",
            targets: ["FirebaseStorageHandler"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: Version("10.0.0")))
    ],
    targets: [
        .target(
            name: "FirebaseStorageHandler",
            dependencies: [
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "FirebaseStorageHandlerTests",
            dependencies: ["FirebaseStorageHandler"]),
    ]
)
