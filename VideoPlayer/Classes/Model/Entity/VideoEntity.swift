//
//  VideoEntity.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import Foundation

class VideoEntity {
  var title: String = ""
  var presenterName: String = ""
  var description: String = ""
  var thumbnailUrl: URL?
  var videoUrl: URL?
  var videoDuration: Int = 0

  init() {
    if let thumbnailUrl = URL(string: "") {
      self.thumbnailUrl = thumbnailUrl
    }

    if let videoUrl = URL(string: "") {
      self.videoUrl = videoUrl
    }
  }
}
