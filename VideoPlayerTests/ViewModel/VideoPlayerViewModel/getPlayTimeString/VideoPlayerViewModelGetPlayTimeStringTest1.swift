//
//  VideoPlayerViewModelGetPlayTimeStringTest1.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest

class VideoPlayerViewModelGetPlayTimeStringTest1: XCTestCase {
  let viewModel = VideoPlayerViewModel()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    let current = TimeInterval(100.0)
    let total = TimeInterval(150.0)
    let playTimeString = viewModel.getPlayTimeString(current: current, total: total)
    XCTAssertEqual("01:40", playTimeString.currentTime)
    XCTAssertEqual("00:50", playTimeString.remainTime)
  }
}
