// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftUIML",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    // Core data model and DSL (no SwiftUI dependency)
    .library(
      name: "SwiftUIMLCore",
      targets: ["SwiftUIMLCore"]
    ),
    // Full framework including SwiftUI rendering
    .library(
      name: "SwiftUIML",
      targets: ["SwiftUIML"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.12.0"),
  ],
  targets: [
    // Core: Data model, DSL, JSON serialization
    .target(
      name: "SwiftUIMLCore",
      dependencies: [],
      path: "Sources/SwiftUIMLCore"
    ),
    // UI: SwiftUI rendering layer
    .target(
      name: "SwiftUIML",
      dependencies: ["SwiftUIMLCore"],
      path: "Sources/SwiftUIML"
    ),
    // Core tests: Serialization, DSL, data model
    .testTarget(
      name: "SwiftUIMLCoreTests",
      dependencies: ["SwiftUIMLCore"]
    ),
    // UI tests: Multi-language snapshot testing with ImageRenderer
    .testTarget(
      name: "SwiftUIMLTests",
      dependencies: [
        "SwiftUIML",
        "SwiftUIMLCore",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ],
      resources: [
        .process("Resources")
      ]
    ),
  ]
)
