// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class Const {
    public static let bundleIdentifier = "io.github.redreamality.GitHubTrendingRSS"

    public static let rssHomeURL = URL(string: "http://redreamality.github.io/GitHubTrendingRSS")!
    public static let gitHubAPIBaseURL = URL(string: "https://api.github.com")!
    public static let gitHubAPIEmojisURL = URL(string: "\(gitHubAPIBaseURL)/emojis")!
    public static let gitHubTopTrendingURL = URL(string: "\(gitHubBaseURL)/trending")!
    public static let gitHubBaseURL = URL(string: "https://github.com")!
    public static let gitHubRepositoryURL = URL(string: "https://github.com/redreamality/GitHubTrendingRSS")!
    public static let pageTitle = "GitHub Trending RSS"
    public static let author = "redreamality"

    public static let outputDirectoryName = "output"
    public static let outputDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent(outputDirectoryName)

    public static var resourcesRootURL: URL {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Resources")

        guard url.hasDirectoryPath else {
            fatalError("Test resources folder doesn't exist: \(url.absoluteString)")
        }
        return url
    }

    public static let googleAnalyticsTrackingCode = "G-MH6YQR4DW2"

    public private(set) static var gitHubClientID: String!
    public private(set) static var gitHubClientSecret: String!

    public static let popularLanguages = [
        "all",
        "c",
        "c++",
        "c#",
        "dockerfile",
        "go",
        "html",
        "java",
        "javascript",
        "jupyter-notebook",
        "python",
        "typescript",
        "xml",
        "xslt",
    ]

    public static func setup(gitHubClientID: String, gitHubClientSecret: String) {
        self.gitHubClientID = gitHubClientID
        self.gitHubClientSecret = gitHubClientSecret
    }
}
