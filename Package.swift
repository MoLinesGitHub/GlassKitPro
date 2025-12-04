// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "GlassKitPro",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "GlassKitPro",
            targets: ["GlassKitPro"]
        ),
        .library(
            name: "GlassKitProAnimations",
            targets: ["GlassKitProAnimations"]
        ),
    ],
    targets: [
        .target(
            name: "GlassKitPro",
            resources: [
                .process("Resources"),
                .process("Shaders"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]
        ),
        .target(
            name: "GlassKitProAnimations",
            dependencies: [],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]
        ),
        .executableTarget(
            name: "GlassKitProDemoApp",
            dependencies: ["GlassKitPro", "GlassKitProAnimations"],
            path: "Examples/GlassKitProDemoApp"
        ),
    ],
    swiftLanguageModes: [.v6]
)
