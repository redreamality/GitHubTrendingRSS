// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import XCTest
import GitHubTrendingRSSKit
import Stencil
import PathKit

final class SiteGeneratorTests: XCTestCase {
    let environment = Environment(loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)]))
    let information = SiteGenerator.Information(
        pageTitle: "page title",
        author: "spring water",
        rssHomeURL: "rss home url",
        googleAnalyticsTrackingCode: "141421356",
        gitHubRepositoryURL: "github repository url")
    
    var generator: SiteGenerator!
    
    override func setUp() {
        generator = SiteGenerator(
            environment: environment,
            information: information)
    }
    
    func testGenerateRSSListHTML() throws {
        let html = try generator.generateHomeHTML(languageTrendingLinks: [
            LanguageTrendingLink(displayName: "Hello", href: "/mshibanami/hello"),
            LanguageTrendingLink(displayName: "World", href: "/mshibanami/world"),])
        
        XCTAssertTrue(html.contains(information.pageTitle))
        XCTAssertTrue(html.contains(information.author))
        XCTAssertTrue(html.contains(information.rssHomeURL))
        XCTAssertTrue(html.contains(information.googleAnalyticsTrackingCode))
        XCTAssertTrue(html.contains(information.gitHubRepositoryURL))
    }
    
    func testGenerateRSS() throws {
        let html = try generator.generateRSS(
            languageTrendingLink: LanguageTrendingLink(displayName: "My Lang", href: "/my/lang"),
            period: .weekly,
            repositories: [
            Repository(pageLink: RepositoryPageLink(href: "hello/world"), summary: "hello world"),
            Repository(pageLink: RepositoryPageLink(href: "foo/bar"), summary: "foo bar")])
        print(html)
    }
}
