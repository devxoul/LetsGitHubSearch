//
//  AppDependency.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Alamofire

struct AppDependency {
  let repositoryService: RepositoryServiceProtocol
  let urlOpener: URLOpenerProtocol
}

extension AppDependency {
  static func resolve() -> AppDependency {
    let sessionManager = SessionManager.default
    let repositoryService = RepositoryService(sessionManager: sessionManager)
    let urlOpener = UIApplication.shared

    return AppDependency(
      repositoryService: repositoryService,
      urlOpener: urlOpener
    )
  }
}
