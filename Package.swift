// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPreview",
    platforms: [.iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "SwiftPreview",
            targets: ["SwiftPreview"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftPreview",
            dependencies: [],
            exclude: ["Templates"]
        ),
        .testTarget(
            name: "SwiftPreviewTests",
            dependencies: ["SwiftPreview"]
        ),
    ]
)
