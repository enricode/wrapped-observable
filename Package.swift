// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "wrappedObservable",
    products: [
        .library(
            name: "wrappedObservable",
            targets: ["wrappedObservable"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "wrappedObservable",
            dependencies: []),
        .testTarget(
            name: "wrappedObservableTests",
            dependencies: ["wrappedObservable"]),
    ]
)
