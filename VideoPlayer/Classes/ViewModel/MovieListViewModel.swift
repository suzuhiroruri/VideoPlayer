//
//  MovieListViewModel.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/10.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieListViewModel {

  let requestAPIModel =  APIModel()
  var videoEntityArray = [VideoEntity]()

  func loadNew(completion completionBlock: @escaping (Bool) -> Void) {
    requestAPIModel.videoListAPI(completion: { response in
      switch response {
      case .success(let json):
        self.videoEntityArray = VideoEntityFactory.sharedInstance.createArrayFromJSONObject(json: json)
        completionBlock(true)
      case .error:
        completionBlock(false)
      }
    })
  }
}
