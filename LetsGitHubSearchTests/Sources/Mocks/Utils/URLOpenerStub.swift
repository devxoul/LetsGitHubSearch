//
//  URLOpenerStub.swift
//  LetsGitHubSearchTests
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import UIKit
@testable import LetsGitHubSearch

final class URLOpenerStub: URLOpenerProtocol {
  var openParameters: URL?

  func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?) {
    self.openParameters = url
  }
}
