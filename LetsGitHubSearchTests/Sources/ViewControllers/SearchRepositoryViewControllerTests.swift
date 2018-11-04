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
  private var viewController: SearchRepositoryViewController!

  override func setUp() {
    super.setUp()
    self.repositoryService = RepositoryServiceStub()

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let identifier = "SearchRepositoryViewController"
    self.viewController.repositoryService = self.repositoryService
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
}
