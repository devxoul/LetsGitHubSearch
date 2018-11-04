//
//  RepositoryService.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 03/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Alamofire

protocol RepositoryServiceProtocol {
  @discardableResult
  func search(keyword: String, completionHandler: @escaping (Result<RepositorySearchResult>) -> Void) -> DataRequest
}

final class RepositoryService: RepositoryServiceProtocol {
  private let sessionManager: SessionManagerProtocol

  init(sessionManager: SessionManagerProtocol) {
    self.sessionManager = sessionManager
  }

  @discardableResult
  func search(keyword: String, completionHandler: @escaping (Result<RepositorySearchResult>) -> Void) -> DataRequest {
    let url = "https://api.github.com/search/repositories"
    let parameters: Parameters = ["q": keyword]
    return self.sessionManager.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: nil)
      .responseData { response in
        let decoder = JSONDecoder()
        let result = response.result.flatMap {
          try decoder.decode(RepositorySearchResult.self, from: $0)
        }
        completionHandler(result)
      }
  }
}
