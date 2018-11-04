//
//  URLOpenerProtocol.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 04/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import UIKit

protocol URLOpenerProtocol {
  func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
}

extension UIApplication: URLOpenerProtocol {
}
