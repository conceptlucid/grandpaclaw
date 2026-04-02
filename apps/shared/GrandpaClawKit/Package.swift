// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GrandpaClawKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "GrandpaClawProtocol", targets: ["GrandpaClawProtocol"]),
        .library(name: "GrandpaClawKit", targets: ["GrandpaClawKit"]),
        .library(name: "GrandpaClawChatUI", targets: ["GrandpaClawChatUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gonzalezreal/textual", exact: "0.2.1"),
    ],
    targets: [
        .target(
            name: "GrandpaClawProtocol",
            path: "Sources/GrandpaClawProtocol"),
        .target(
            name: "GrandpaClawKit",
            dependencies: [
                "GrandpaClawProtocol",
            ],
            path: "Sources/GrandpaClawKitModule",
            resources: [
                .process("Resources"),
            ]),
        .target(
            name: "GrandpaClawChatUI",
            dependencies: [
                "GrandpaClawKit",
                .product(name: "Textual", package: "textual"),
            ],
            path: "Sources/GrandpaClawChatUI"),
    ])
