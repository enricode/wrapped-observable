// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Wrapped Observable",
    products: [
        .library(
            name: "WrappedObservable",
            targets: ["WrappedObservable"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WrappedObservable",
            dependencies: []
        ),
        .testTarget(
            name: "Wrapped Observable Tests",
            dependencies: ["WrappedObservable"]
        )
    ]
)
