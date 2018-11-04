//
//  AppDelegate.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 03/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  private let appDependency: AppDependency = AppDependency.resolve()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if let rootViewController = self.rootViewController() {
      rootViewController.repositoryService = self.appDependency.repositoryService
    }
    return true
  }

  private func rootViewController() -> SearchRepositoryViewController? {
    let navigationController = self.window?.rootViewController as? UINavigationController
    return navigationController?.viewControllers.first as? SearchRepositoryViewController
  }
}
