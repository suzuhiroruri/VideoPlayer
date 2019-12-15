//
//  VideoListViewModel.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/10.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Alamofire
import SwiftyJSON

class VideoListViewModel {

  let requestAPIModel =  APIModel()
  var videoEntityArray = [VideoEntity]()

  func loadNew(completion completionBlock: @escaping (Bool) -> Void) {
    requestAPIModel.videoListAPI(completion: { [weak self] response in
      guard let `self` = self else {
        return
      }
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
