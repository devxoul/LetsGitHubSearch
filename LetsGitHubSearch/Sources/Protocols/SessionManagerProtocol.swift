//
//  SessionManagerProtocol.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import Alamofire

protocol SessionManagerProtocol {
  @discardableResult
  func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?) -> DataRequest
}

extension SessionManager: SessionManagerProtocol {
}
