//
//  SessionManagerStub.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

@testable import Alamofire
@testable import LetsGitHubSearch

final class SessionManagerStub: SessionManagerProtocol {
  var requestParameters: (url: URLConvertible, method: HTTPMethod, parameters: Parameters?)?

  func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?) -> DataRequest {
    self.requestParameters = (url, method, parameters)
    return DataRequest(session: URLSession(), requestTask: .data(nil, nil))
  }
}
