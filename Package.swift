// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VisionUtils",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VisionUtils",
            targets: ["VisionUtils"]),
        .library(name: "VisionWeightCalculator",
                 targets: ["VisionWeightCalculator"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "VisionUtils",
            path: "Sources/VisionUtils"),
        .target(
            name: "VisionWeightCalculator",
            path: "Sources/VisionWeightCalculator"),
        .testTarget(
            name: "VisionUtilsTests",
            dependencies: ["VisionUtils"]),
    ]
)
