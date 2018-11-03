//
//  SearchResult.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Foundation

struct RepositorySearchResult: Decodable {
  let totalCount: Int
  let items: [Repository]

  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case items
  }
}
