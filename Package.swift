// swift-tools-version:5.1
// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import PackageDescription

let package = Package(
    name: "GitHubTrendingRSS",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
        .package(url: "https://github.com/iwasrobbed/Down.git", from: "0.8.5"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.2.0"),
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.13.1"),
    ],
    targets: [
        .target(
            name: "GitHubTrendingRSS",
            dependencies: [
              "GitHubTrendingRSSKit",
              "SPMUtility",
          ]),
        .target(
            name: "GitHubTrendingRSSKit",
            dependencies: [
              "Down",
              "Stencil",
              "SwiftSoup",
          ]),
        .testTarget(
            name: "GitHubTrendingRSSTests",
            dependencies: [
                "GitHubTrendingRSSKit",
            ]),
    ]
)
