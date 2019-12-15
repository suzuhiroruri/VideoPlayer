//
//  VideoEntity.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Foundation
import SwiftyJSON

struct VideoEntity {
  let title: String
  let presenterName: String
  let description: String
  let thumbnailUrl: URL?
  let videoUrl: URL?
  let videoDuration: Double
}
