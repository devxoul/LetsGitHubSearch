//
//  RepositoryServiceTests.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Alamofire
import XCTest
@testable import LetsGitHubSearch

final class RepositoryServiceTests: XCTestCase {
  func testSearch_callsSearchAPIWithParameters() {
    // given
    let sessionManager = SessionManagerStub()
    let service = RepositoryService(sessionManager: sessionManager)

    // when
    service.search(keyword: "RxSwift", completionHandler: { _ in })

    // then
    let expectedURL = "https://api.github.com/search/repositories"
    let actualURL = try? sessionManager.requestParameters?.url.asURL().absoluteString
    XCTAssertEqual(actualURL, expectedURL)

    let expectedMethod = HTTPMethod.get
    let actualMethod = sessionManager.requestParameters?.method
    XCTAssertEqual(actualMethod, expectedMethod)

    let expectedParameters = ["q": "RxSwift"]
    let actualParameters = sessionManager.requestParameters?.parameters as? [String: String]
    XCTAssertEqual(actualParameters, expectedParameters)
  }
}
