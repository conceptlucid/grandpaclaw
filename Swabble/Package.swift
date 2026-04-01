// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "swabble",
    platforms: [
        .macOS(.v12),
        .iOS(.v16),
    ],
    products: [
        .library(name: "Swabble", targets: ["Swabble"]),
        .library(name: "SwabbleKit", targets: ["SwabbleKit"]),
        .executable(name: "swabble", targets: ["SwabbleCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/steipete/Commander.git", exact: "0.2.1"),
    ],
    targets: [
        .target(
            name: "Swabble",
            path: "Sources/SwabbleCore"),
        .target(
            name: "SwabbleKit",
            path: "Sources/SwabbleKit"),
        .executableTarget(
            name: "SwabbleCLI",
            dependencies: [
                "Swabble",
                "SwabbleKit",
                .product(name: "Commander", package: "Commander"),
            ],
            path: "Sources/swabble"),
    ])
