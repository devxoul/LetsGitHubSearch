//
//  RepositoryServiceTests.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import XCTest
@testable import LetsGitHubSearch

final class RepositoryServiceTests: XCTestCase {
  func testSearch_includesSearchResult() {
    // given
    let expectation = XCTestExpectation()
    XCTWaiter().wait(for: [expectation], timeout: 10)

    // then
    RepositoryService.search(keyword: "RxSwift") { result in
      expectation.fulfill()
      XCTAssertEqual(result.isSuccess, true)
      XCTAssertEqual(result.value?.items.contains(where: { $0.name == "RxSwift" }), true)
    }
  }
}
