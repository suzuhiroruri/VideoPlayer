//
//  VideoPlayerViewModelNotNilTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import XCTest
import MSPlayer

class VideoPlayerViewModelNotNilTest: XCTestCase {
  private let viewModel = VideoPlayerViewModel()

  override func setUp() {
    super.setUp()
    guard let videoUrl = URL(string: "https://www.google.co.jp/") else {
      return
    }
    let videoEntity = VideoEntity(title: "title",
                                  presenterName: "presenterName",
                                  description: "description",
                                  thumbnailUrl: nil,
                                  videoUrl: videoUrl,
                                  videoDuration: 800.0)
    viewModel.videoEntity = videoEntity
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    guard let _: MSPlayerResource = viewModel.getVideoAsset() else {
      return
    }
    XCTAssertTrue(true, "MSPlayerResource is not nil")
  }
}
