//
//  VideoPlayerViewModelGetPlayTimeStringTest2.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest

class VideoPlayerViewModelGetPlayTimeStringTest2: XCTestCase {
  let viewModel = VideoPlayerViewModel()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    let current = TimeInterval(100.0)
    let total = TimeInterval(100.0)
    let playTimeString = viewModel.getPlayTimeString(current: current, total: total)
    XCTAssertEqual("", playTimeString.currentTime)
    XCTAssertEqual("", playTimeString.remainTime)
  }
}
