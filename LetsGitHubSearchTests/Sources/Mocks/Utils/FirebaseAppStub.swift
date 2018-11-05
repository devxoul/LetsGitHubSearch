//
//  FirebaseAppStub.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 05/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

@testable import LetsGitHubSearch

final class FirebaseAppStub: FirebaseAppProtocol {
  static var configureExecutionCount = 0

  static func configure() {
    self.configureExecutionCount += 1
  }
}
