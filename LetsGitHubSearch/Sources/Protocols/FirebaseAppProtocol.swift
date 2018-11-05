//
//  FirebaseAppProtocol.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 05/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Firebase

protocol FirebaseAppProtocol {
  static func configure()
}

extension FirebaseApp: FirebaseAppProtocol {
}
