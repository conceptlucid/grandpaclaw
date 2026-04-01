// swift-tools-version: 6.0
// Package manifest for the GrandpaClaw macOS companion (menu bar app + IPC library).

import PackageDescription

let package = Package(
    name: "GrandpaClaw",
    platforms: [
        .macOS(.v15),
    ],
    products: [
        .library(name: "GrandpaClawIPC", targets: ["GrandpaClawIPC"]),
        .library(name: "GrandpaClawDiscovery", targets: ["GrandpaClawDiscovery"]),
        .executable(name: "GrandpaClaw", targets: ["GrandpaClaw"]),
        .executable(name: "grandpaclaw-mac", targets: ["GrandpaClawMacCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/orchetect/MenuBarExtraAccess", exact: "1.2.2"),
        .package(url: "https://github.com/swiftlang/swift-subprocess.git", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.8.0"),
        .package(url: "https://github.com/sparkle-project/Sparkle", from: "2.8.1"),
        .package(url: "https://github.com/steipete/Peekaboo.git", branch: "main"),
        .package(path: "../shared/GrandpaClawKit"),
        .package(path: "../../Swabble"),
    ],
    targets: [
        .target(
            name: "GrandpaClawIPC",
            dependencies: [],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .target(
            name: "GrandpaClawDiscovery",
            dependencies: [
                .product(name: "GrandpaClawKit", package: "GrandpaClawKit"),
            ],
            path: "Sources/GrandpaClawDiscovery",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .executableTarget(
            name: "GrandpaClaw",
            dependencies: [
                "GrandpaClawIPC",
                "GrandpaClawDiscovery",
                .product(name: "GrandpaClawKit", package: "GrandpaClawKit"),
                .product(name: "GrandpaClawChatUI", package: "GrandpaClawKit"),
                .product(name: "GrandpaClawProtocol", package: "GrandpaClawKit"),
                .product(name: "SwabbleKit", package: "swabble"),
                .product(name: "MenuBarExtraAccess", package: "MenuBarExtraAccess"),
                .product(name: "Subprocess", package: "swift-subprocess"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Sparkle", package: "Sparkle"),
                .product(name: "PeekabooBridge", package: "Peekaboo"),
                .product(name: "PeekabooAutomationKit", package: "Peekaboo"),
            ],
            exclude: [
                "Resources/Info.plist",
            ],
            resources: [
                .copy("Resources/GrandpaClaw.icns"),
                .copy("Resources/DeviceModels"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .executableTarget(
            name: "GrandpaClawMacCLI",
            dependencies: [
                "GrandpaClawDiscovery",
                .product(name: "GrandpaClawKit", package: "GrandpaClawKit"),
                .product(name: "GrandpaClawProtocol", package: "GrandpaClawKit"),
            ],
            path: "Sources/GrandpaClawMacCLI",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .testTarget(
            name: "GrandpaClawIPCTests",
            dependencies: [
                "GrandpaClawIPC",
                "GrandpaClaw",
                "GrandpaClawDiscovery",
                .product(name: "GrandpaClawProtocol", package: "GrandpaClawKit"),
                .product(name: "SwabbleKit", package: "swabble"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
                .enableExperimentalFeature("SwiftTesting"),
            ]),
    ])
