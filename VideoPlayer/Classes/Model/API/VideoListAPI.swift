//
//  VideoListAPI.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/12.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Alamofire
import SwiftyJSON

extension APIModel {
  func videoListAPI(completion completionBlock: @escaping (VPAPIResponse<JSON>) -> Void) {
    let apiName = APIName.playlist.rawValue
    sendGetJSONRequest(apiName: apiName, completion: { response in
      switch response {
      case .success(let json):
        completionBlock(.success(json))
      case .error(let error):
        completionBlock(.error(error))
      }
    })
  }
}
