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
  let fullName: String
  let stargazersCount: Int

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case fullName = "full_name"
    case stargazersCount = "stargazers_count"
  }
}
