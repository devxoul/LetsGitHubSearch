//
//  RepositoryServiceStub.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

@testable import Alamofire
@testable import LetsGitHubSearch

final class RepositoryServiceStub: RepositoryServiceProtocol {
  var searchParameters: (keyword: String, completionHandler: (Result<RepositorySearchResult>) -> Void)?

  @discardableResult
  func search(keyword: String, completionHandler: @escaping (Result<RepositorySearchResult>) -> Void) -> DataRequest {
    self.searchParameters = (keyword, completionHandler)
    return DataRequest(session: URLSession(), requestTask: .data(nil, nil))
  }
}
