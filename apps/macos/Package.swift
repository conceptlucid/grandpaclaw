// swift-tools-version: 5.9
// Package manifest for the GrandpaClaw macOS companion (menu bar app + IPC library).

import PackageDescription

let package = Package(
    name: "GrandpaClaw",
    platforms: [
        .macOS(.v12),
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
        .package(url: "https://github.com/sparkle-project/Sparkle", from: "2.5.0"),
        .package(url: "https://github.com/steipete/Peekaboo.git", exact: "1.0.1"),
        .package(path: "../shared/GrandpaClawKit"),
        .package(path: "../../Swabble"),
    ],
    targets: [
        .target(
            name: "GrandpaClawIPC",
            dependencies: []),
        .target(
            name: "GrandpaClawDiscovery",
            dependencies: [
                .product(name: "GrandpaClawKit", package: "GrandpaClawKit"),
            ],
            path: "Sources/GrandpaClawDiscovery"),
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
            ]),
        .executableTarget(
            name: "GrandpaClawMacCLI",
            dependencies: [
                "GrandpaClawDiscovery",
                .product(name: "GrandpaClawKit", package: "GrandpaClawKit"),
                .product(name: "GrandpaClawProtocol", package: "GrandpaClawKit"),
            ],
            path: "Sources/GrandpaClawMacCLI"),
    ])
