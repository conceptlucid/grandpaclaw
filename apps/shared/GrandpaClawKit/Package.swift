// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "GrandpaClawKit",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
    ],
    products: [
        .library(name: "GrandpaClawProtocol", targets: ["GrandpaClawProtocol"]),
        .library(name: "GrandpaClawKit", targets: ["GrandpaClawKit"]),
        .library(name: "GrandpaClawChatUI", targets: ["GrandpaClawChatUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/steipete/ElevenLabsKit", exact: "0.1.0"),
        .package(url: "https://github.com/gonzalezreal/textual", exact: "0.3.1"),
    ],
    targets: [
        .target(
            name: "GrandpaClawProtocol",
            path: "Sources/GrandpaClawProtocol",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .target(
            name: "GrandpaClawKit",
            dependencies: [
                "GrandpaClawProtocol",
                .product(name: "ElevenLabsKit", package: "ElevenLabsKit"),
            ],
            path: "Sources/GrandpaClawKit",
            resources: [
                .process("Resources"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .target(
            name: "GrandpaClawChatUI",
            dependencies: [
                "GrandpaClawKit",
                .product(
                    name: "Textual",
                    package: "textual",
                    condition: .when(platforms: [.macOS, .iOS])),
            ],
            path: "Sources/GrandpaClawChatUI",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .testTarget(
            name: "GrandpaClawKitTests",
            dependencies: ["GrandpaClawKit", "GrandpaClawChatUI"],
            path: "Tests/GrandpaClawKitTests",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
                .enableExperimentalFeature("SwiftTesting"),
            ]),
    ])
