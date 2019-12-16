//
//  VideoPlayerViewModelGetPlayTimeStringTest3.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest

class VideoPlayerViewModelGetPlayTimeStringTest3: XCTestCase {
  private let viewModel = VideoPlayerViewModel()

  private var current: TimeInterval = TimeInterval(0.0)
  private var total: TimeInterval = TimeInterval(0.0)

  override func setUp() {
    super.setUp()
    current = TimeInterval(200.0)
    total = TimeInterval(100.0)
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    let playTimeString = viewModel.getPlayTimeString(current: current, total: total)
    XCTAssertEqual("", playTimeString.currentTime)
    XCTAssertEqual("", playTimeString.remainTime)
  }
}
