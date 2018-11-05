//
//  AppDelegateTests.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 05/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import XCTest
@testable import LetsGitHubSearch

final class AppDelegateTests: XCTestCase {
  func testDidFinishLaunching_configureFirebaseApp() {
    // given
    let firebaseApp = FirebaseAppStub.self
    firebaseApp.configureExecutionCount = 0

    let dependency = AppDependency(
      firebaseApp: firebaseApp,
      repositoryService: RepositoryServiceStub(),
      urlOpener: URLOpenerStub()
    )
    let appDelegate = AppDelegate(dependency: dependency)

    // when
    _ = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)

    // then
    XCTAssertEqual(firebaseApp.configureExecutionCount, 1)
  }
}
