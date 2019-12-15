//
//  VideoEntityFactory.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/12.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Foundation
import SwiftyJSON

final class VideoEntityFactory {

  static let sharedInstance = VideoEntityFactory()

  private init() {}

  private func createFromJSONObject(json: JSON) -> VideoEntity? {
    var title: String = ""
    if let jsonTitle =  json["title"].string {
      title = jsonTitle
    }

    var presenterName: String = ""
    if let jsonPresenterName =  json["presenter_name"].string {
      presenterName = jsonPresenterName
    }

    var description: String = ""
    if let jsonDescription =  json["description"].string {
      description = jsonDescription
    }

    var thumbnailUrl: URL?
    if let jsonThumbnailUrl =  json["thumbnail_url"].url {
      thumbnailUrl = jsonThumbnailUrl
    }

    var videoUrl: URL?
    if let jsonVideoUrl =  json["video_url"].url {
      videoUrl = jsonVideoUrl
    }

    var videoDuration: Int = 0
    if let jsonVideoDuration =  json["video_duration"].int {
      videoDuration = jsonVideoDuration
    }
    return VideoEntity(title: title,
                       presenterName: presenterName,
                       description: description,
                       thumbnailUrl: thumbnailUrl,
                       videoUrl: videoUrl,
                       videoDuration: videoDuration)
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
