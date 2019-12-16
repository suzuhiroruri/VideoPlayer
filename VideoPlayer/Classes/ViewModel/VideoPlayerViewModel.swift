//
//  VideoPlayerViewModel.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import MSPlayer

class VideoPlayerViewModel {
  var videoEntity: VideoEntity?

  func getVideoAsset() -> MSPlayerResource? {
    guard let videoEntity = videoEntity,
      let videoURL = videoEntity.videoUrl else {
      return nil
    }
    let resourceDefinition: MSPlayerResourceDefinition
      = MSPlayerResourceDefinition(videoId: videoURL.absoluteString,
                                   videoName: videoEntity.title,
                                   url: videoURL,
                                   definition: "",
                                   coverURLRequest: nil)
    let asset: MSPlayerResource = MSPlayerResource(definitions: [resourceDefinition])
    return asset
  }

  func getPlayTimeString(current: TimeInterval,
                         total: TimeInterval) -> (currentTime: String, remainTime: String) {
    var playTimeString = (currentTime:"", remainTime: "")
    guard current < total else {
      return playTimeString
    }

    let currentTimeInterval: Double = floor(current)
    playTimeString.currentTime = currentTimeInterval.makeTimeDurationString()

    let remainTimeInterval: Double = total - currentTimeInterval
    playTimeString.remainTime = remainTimeInterval.makeTimeDurationString()

    return playTimeString
  }
}
