//
//  File.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/12.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

extension APIModel {
  func videoListAPI(completion completionBlock: @escaping (VPAPIResponse<JSON>) -> Void) {
    let apiName = APIName.playlist.rawValue
    sendGetJSONRequest(apiName: apiName, completion: {[weak self] response in
      guard self != nil else {
        completionBlock(.error(VPError.apiUnkownError))
        return
      }
      switch response {
      case .success(let json):
        completionBlock(.success(json))
      case .error:
        completionBlock(.error(VPError.apiUnkownError))
      }
    })
  }
}
