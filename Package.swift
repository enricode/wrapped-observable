// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "observable",
    products: [
        .library(
            name: "observable",
            targets: ["observable"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "observable",
            dependencies: []),
        .testTarget(
            name: "observableTests",
            dependencies: ["observable"]),
    ]
)
