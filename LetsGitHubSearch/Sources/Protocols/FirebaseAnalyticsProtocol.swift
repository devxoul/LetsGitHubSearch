//
//  FirebaseAnalyticsProtocol.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 05/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Firebase

protocol FirebaseAnalyticsProtocol {
  static func logEvent(_ name: String, parameters: [String : Any]?)
}

extension Firebase.Analytics: FirebaseAnalyticsProtocol {
}
