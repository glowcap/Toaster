// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Toaster",
    platforms: [
      .iOS(.v15), .macOS(.v12), .tvOS(.v15)
    ],
    products: [
        .library(
            name: "Toaster",
            targets: ["Toaster"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Toaster",
            dependencies: []),
        .testTarget(
            name: "ToasterTests",
            dependencies: ["Toaster"],
            resources: [.process("Resources")]),
    ],
    swiftLanguageVersions: [.v5]
)
