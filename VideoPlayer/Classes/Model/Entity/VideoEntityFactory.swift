//
//  VideoEntityFactory.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/12.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON

final class VideoEntityFactory {

  static let sharedInstance = VideoEntityFactory()

  private init() {}

  private func createFromJSONObject(json: JSON) -> VideoEntity? {
    return VideoEntity(title: "",
                       presenterName: "",
                       description: "",
                       thumbnailUrl: nil,
                       videoUrl: nil,
                       videoDuration: 0)
  }

  func createArrayFromJSONObject(json: JSON) -> [VideoEntity] {
    var result: [VideoEntity] = []
    for (_, subJson): (String, JSON) in json {
      if let videoEntity = createFromJSONObject(json: subJson) {
        result.append(videoEntity)
      }
    }
    return result
  }
}
