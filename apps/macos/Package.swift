// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GrandpaClaw",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .executable(name: "GrandpaClaw", targets: ["GrandpaClaw"]),
    ],
    dependencies: [
        .package(path: "../shared/GrandpaClawKit"),
    ],
    targets: [
        .executableTarget(
            name: "GrandpaClaw",
            dependencies: [
                .product(name: "GrandpaClawKit", package: "GrandpaClawKit"),
                .product(name: "GrandpaClawChatUI", package: "GrandpaClawKit"),
                .product(name: "GrandpaClawProtocol", package: "GrandpaClawKit"),
            ],
            path: "Sources/GrandpaClaw",
            resources: [
                .copy("Resources/GrandpaClaw.icns"),
            ]),
    ])
