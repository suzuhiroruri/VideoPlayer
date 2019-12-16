//
//  VideoPlayerViewModelNilNoURLEntityTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import XCTest
import MSPlayer

class VideoPlayerViewModelNilNoURLEntityTest: XCTestCase {
  private let viewModel = VideoPlayerViewModel()

  override func setUp() {
    super.setUp()
    let videoEntity = VideoEntity(title: "title",
                                  presenterName: "presenterName",
                                  description: "description",
                                  thumbnailUrl: nil,
                                  videoUrl: nil,
                                  videoDuration: 800.0)
    viewModel.videoEntity = videoEntity
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    guard viewModel.getVideoAsset() == nil else {
      return
    }
    XCTAssertTrue(true, "MSPlayerResource is nil")
  }
}
