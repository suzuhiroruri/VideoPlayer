//
//  Bundle+.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import Foundation

extension Bundle {
  enum ServerKey: String {
    case appApiHost = "AppAPIHost"
  }

  class func ServerString(key: ServerKey) -> String {
    guard let serverDictionary = Bundle.main.infoDictionary?["Server"] as? Dictionary<String, String> else {
      return ""
    }
    guard let returnString = serverDictionary[key.rawValue] as String? else {
      return ""
    }

    return  returnString
  }
}