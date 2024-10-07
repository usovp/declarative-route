// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-declarative-route",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "DeclarativeRoute",
            targets: ["DeclarativeRoute"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-case-paths.git", .upToNextMinor(from: "1.0.0")
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-navigation.git", .upToNextMinor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "DeclarativeRoute",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swift-navigation"),
                .product(name: "CasePaths", package: "swift-case-paths")
            ]
        ),

    ]
)
