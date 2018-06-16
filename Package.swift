// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftFlyer",
    products: [
        .library(name: "SwiftFlyer", targets: ["SwiftFlyer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMinor(from: "0.8.3")),
        .package(url: "https://github.com/c-bata/Starscream.git", .branch("support-spm4")),
    ],
    targets: [
        .target(
             name: "SwiftFlyer",
             dependencies: ["CryptoSwift", "Starscream"],
             path: "",
             exclude: ["Example"]
        )
    ]
)

