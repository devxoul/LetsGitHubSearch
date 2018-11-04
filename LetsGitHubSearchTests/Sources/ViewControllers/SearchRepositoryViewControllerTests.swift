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
  func testSearchBar_whenSearchBarSearchButtonClicked_searchWithText() {
    // given
    let repositoryService = RepositoryServiceStub()
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchRepositoryViewController") as! SearchRepositoryViewController
    viewController.repositoryService = repositoryService
    _ = viewController.view

    // when
    let searchBar = viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // then
    XCTAssertEqual(repositoryService.searchParameters, "ReactorKit")
  }

  func testTableView_isHidden_whileSearching() {
    // given
    let repositoryService = RepositoryServiceStub()
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchRepositoryViewController") as! SearchRepositoryViewController
    viewController.repositoryService = repositoryService
    _ = viewController.view

    // when
    let searchBar = viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // then
    XCTAssertTrue(viewController.tableView.isHidden)
  }
}
