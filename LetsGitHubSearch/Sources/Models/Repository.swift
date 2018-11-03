//
//  Repository.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Foundation

struct Repository: Decodable {
  let name: String

  enum CodingKeys: String, CodingKey {
    case name = "name"
  }
}
