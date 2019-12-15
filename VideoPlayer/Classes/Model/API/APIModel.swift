//
//  APIModel.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Alamofire

class APIModel {
  var currentRequest: DataRequest?

  enum SendServerType {
    /// app API
    case appApi

    /// host name
    var hostName: String {
      switch self {
      case .appApi:
        return Bundle.ServerString(key: .appApiHost)
      }
    }
  }

  /// API Path
  enum APIName: String {
    case playlist = "/resources/jsons/playlists.json"
  }
}
