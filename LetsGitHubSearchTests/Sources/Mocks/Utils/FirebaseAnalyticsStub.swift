//
//  FirebaseAnalyticsStub.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 05/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

@testable import LetsGitHubSearch

final class FirebaseAnalyticsStub: FirebaseAnalyticsProtocol {
  static var logEventParameters: (name: String, parameters: [String : Any]?)?

  class func logEvent(_ name: String, parameters: [String : Any]?) {
    self.logEventParameters = (name, parameters)
  }
}
