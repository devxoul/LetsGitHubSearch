//
//  SearchRepositoryViewControllerTests.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 03/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import XCTest
@testable import LetsGitHubSearch

final class SearchRepositoryViewControllerTests: XCTestCase {
  private var repositoryService: RepositoryServiceStub!
  private var urlOpener: URLOpenerStub!
  private var viewController: SearchRepositoryViewController!

  override func setUp() {
    super.setUp()
    self.repositoryService = RepositoryServiceStub()
    self.urlOpener = URLOpenerStub()

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let identifier = "SearchRepositoryViewController"
    self.viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? SearchRepositoryViewController
    self.viewController.repositoryService = self.repositoryService
    self.viewController.urlOpener = self.urlOpener
    self.viewController.loadViewIfNeeded()
  }

  func testSearchBar_whenSearchBarSearchButtonClicked_searchWithText() {
    // when
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // then
    XCTAssertEqual(self.repositoryService.searchParameters?.keyword, "ReactorKit")
  }

  func testActivityIndicatorView_isAnimating_whileSearching() {
    // when
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // then
    XCTAssertTrue(self.viewController.activityIndicatorView.isAnimating)
  }

  func testActivityIndicatorView_isNotAnimating_afterSearching() {
    // given
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // when
    self.repositoryService.searchParameters?.completionHandler(.failure(TestError()))

    // then
    XCTAssertFalse(self.viewController.activityIndicatorView.isAnimating)
  }

  func testTableView_isHidden_whileSearching() {
    // when
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // then
    XCTAssertTrue(self.viewController.tableView.isHidden)
  }

  func testTableView_isVisible_afterSearching() {
    // given
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // when
    self.repositoryService.searchParameters?.completionHandler(.failure(TestError()))

    // then
    XCTAssertFalse(self.viewController.tableView.isHidden)
  }

  func testTableView_configureRepositoryCell_afterSearching() {
    // given
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // when
    let repositories = [
      Repository(name: "ReactorKit1", fullName: "devxoul/ReactorKit1", stargazersCount: 1289),
      Repository(name: "ReactorKit2", fullName: "younatics/ReactorKit2", stargazersCount: 987),
      Repository(name: "ReactorKit3", fullName: "cruisediary/ReactorKit3", stargazersCount: 543),
    ]
    let searchResult = RepositorySearchResult(totalCount: 3, items: repositories)
    self.repositoryService.searchParameters?.completionHandler(.success(searchResult))

    // then
    let numberOfRows = self.viewController.tableView.numberOfRows(inSection: 0)
    XCTAssertEqual(numberOfRows, 3)

    let cell0 = self.viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
    XCTAssertEqual(cell0?.textLabel?.text, "devxoul/ReactorKit1")
    XCTAssertEqual(cell0?.detailTextLabel?.text?.contains("1,289"), true)

    let cell1 = self.viewController.tableView.cellForRow(at: IndexPath(row: 1, section: 0))
    XCTAssertEqual(cell1?.textLabel?.text, "younatics/ReactorKit2")
    XCTAssertEqual(cell1?.detailTextLabel?.text?.contains("987"), true)

    let cell2 = self.viewController.tableView.cellForRow(at: IndexPath(row: 2, section: 0))
    XCTAssertEqual(cell2?.textLabel?.text, "cruisediary/ReactorKit3")
    XCTAssertEqual(cell2?.detailTextLabel?.text?.contains("543"), true)
  }

  func testTableView_openRepositoryWebPage_whenSelectItem() {
    // given
    let searchBar = self.viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    let repositories = [
      Repository(name: "ReactorKit1", fullName: "devxoul/ReactorKit1", stargazersCount: 1289),
      Repository(name: "ReactorKit2", fullName: "younatics/ReactorKit2", stargazersCount: 987),
      Repository(name: "ReactorKit3", fullName: "cruisediary/ReactorKit3", stargazersCount: 543),
    ]
    let searchResult = RepositorySearchResult(totalCount: 3, items: repositories)
    self.repositoryService.searchParameters?.completionHandler(.success(searchResult))

    // when
    let tableView = self.viewController.tableView!
    tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

    // then
    XCTAssertEqual(self.urlOpener.openParameters?.absoluteString, "https://github.com/devxoul/ReactorKit1")
  }
}
