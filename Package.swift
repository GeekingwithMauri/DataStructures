// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStructures",
    products: [
        .library(
            name: "DataStructures",
            targets: ["DataStructures"]),
    ],
    targets: [
        .target(
            name: "DataStructures"),
        .testTarget(
            name: "DataStructuresTests",
            dependencies: ["DataStructures"]),
    ]
)
