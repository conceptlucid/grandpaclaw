// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GrandpaClawKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
    ],
    products: [
        .library(name: "GrandpaClawProtocol", targets: ["GrandpaClawProtocol"]),
        .library(name: "GrandpaClawKit", targets: ["GrandpaClawKit"]),
        .library(name: "GrandpaClawChatUI", targets: ["GrandpaClawChatUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GrandpaClawProtocol",
            path: "Sources/GrandpaClawProtocol"),
        .target(
            name: "GrandpaClawKit",
            dependencies: [
                "GrandpaClawProtocol",
            ],
            path: "Sources/GrandpaClawKit",
            resources: [
                .process("Resources"),
            ]),
        .target(
            name: "GrandpaClawChatUI",
            dependencies: [
                "GrandpaClawKit",
            ],
            path: "Sources/GrandpaClawChatUI"),
        .testTarget(
            name: "GrandpaClawKitTests",
            dependencies: ["GrandpaClawKit", "GrandpaClawChatUI"],
            path: "Tests/GrandpaClawKitTests"),
    ])
