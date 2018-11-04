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
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchRepositoryViewController") as! SearchRepositoryViewController
    _ = viewController.view

    // when
    let searchBar = viewController.searchController.searchBar
    searchBar.text = "ReactorKit"
    searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

    // then
    XCTWaiter().wait(for: [XCTestExpectation()], timeout: 3)
    let cell = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
    XCTAssertEqual(cell?.textLabel?.text, "ReactorKit")
  }
}
