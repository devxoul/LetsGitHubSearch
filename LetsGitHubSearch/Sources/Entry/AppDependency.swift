//
//  AppDependency.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Alamofire
import Firebase

struct AppDependency {
  let firebaseApp: FirebaseAppProtocol.Type
  let searchRepositoryViewControllerDependency: SearchRepositoryViewController.Dependency
}

extension AppDependency {
  static func resolve() -> AppDependency {
    let sessionManager = SessionManager.default
    let repositoryService = RepositoryService(sessionManager: sessionManager)
    let urlOpener = UIApplication.shared

    return AppDependency(
      firebaseApp: FirebaseApp.self,
      searchRepositoryViewControllerDependency: .init(
        repositoryService: repositoryService,
        urlOpener: urlOpener,
        firebaseAnalytics: Firebase.Analytics.self
      )
    )
  }
}
