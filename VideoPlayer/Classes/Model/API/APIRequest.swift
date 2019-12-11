//
//  APIRequest.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum VPAPIResponse<T> {
  case success(T)
  case error(VPError)
}

extension APIModel {

  func sendGetJSONRequest(hostName: String = Bundle.ServerString(key: .appApiHost),
                          apiName: String,
                          completion completionBlock: @escaping (VPAPIResponse<JSON>) -> Void = {_ in}) {

    let host: String = hostName

    // HTTP request
    let protcolName: String = "https"
    guard let url = URL(string: String(format: "%@://%@/%@?%@",
                                       protcolName,
                                       host,
                                       apiName)) else {
      return
    }
    var req: URLRequest
    do {
      req = try URLRequest(url: url, method: .get, headers: nil)
      // req.timeoutInterval = Bundle.timeout()
      req.setValue("text/plain, application/json, text/html", forHTTPHeaderField: "Accept")
    } catch {
      completionBlock()
      return
    }
    currentRequest = Alamofire.request(req)

    currentRequest?.responseData(queue: DispatchQueue.global(), completionHandler: {[weak self] response in
      guard self != nil else {
        completionBlock()
        return
      }
      switch response.result {
      case .success(let data):
        guard response.response != nil else {
          completionBlock()
          return
        }

        var json = JSON(data)

        guard json.error == nil else {
          completionBlock()
          return
        }

        completionBlock(.success(json))
      case .failure(let error):
        guard let error = error as? URLError else {
          completionBlock()
          return
        }
        if error.code  == URLError.Code.notConnectedToInternet {
          return
        } else {
          completionBlock()
          return
        }
      }
    })
  }
}
