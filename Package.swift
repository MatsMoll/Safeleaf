// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Safeleaf",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Safeleaf",
            targets: ["Safeleaf"]),
    ],
    dependencies: [
        // Making it possible to get the name of a `KeyPath`
        .package(url: "https://github.com/MatsMoll/codable-kit.git", .branch("nested-keypath-bug")),

        // 📄 Easy-to-use foundation for building powerful templating languages in Swift.
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Safeleaf",
            dependencies: ["CodableKit", "Leaf"]),
        .testTarget(
            name: "SafeleafTests",
            dependencies: ["Safeleaf"]),
    ]
)
