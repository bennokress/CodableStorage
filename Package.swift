// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let codableStorage = "CodableStorage"

let package = Package(
    name: codableStorage,
    platforms: [
        .iOS(.v12),
        .macCatalyst(.v13),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4)
    ],
    products: [
        .library(name: codableStorage, targets: [codableStorage])
    ],
    targets: [
        .target(name: codableStorage, dependencies: [])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
