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
  private let appDependency: AppDependency

  /// iOS 시스템에 의해 자동으로 호출되는 생성자
  private override init() {
    self.appDependency = AppDependency.resolve()
  }

  /// 테스트시에만 호출하는 생성자
  init(dependency: AppDependency) {
    self.appDependency = dependency
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.appDependency.firebaseApp.configure()

    if let rootViewController = self.rootViewController() {
      rootViewController.dependency = self.appDependency.searchRepositoryViewControllerDependency
    }
    return true
  }

  private func rootViewController() -> SearchRepositoryViewController? {
    let navigationController = self.window?.rootViewController as? UINavigationController
    return navigationController?.viewControllers.first as? SearchRepositoryViewController
  }
}
