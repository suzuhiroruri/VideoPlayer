//
//  VideoPlayerViewModelGetPlayTimeStringTest1.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
@testable import VideoPlayer

class VideoPlayerViewModelGetPlayTimeStringTest1: XCTestCase {
  private let viewModel = VideoPlayerViewModel()

  private var current: TimeInterval = TimeInterval(0.0)
  private var total: TimeInterval = TimeInterval(0.0)

  override func setUp() {
    super.setUp()
    current = TimeInterval(100.0)
    total = TimeInterval(150.0)
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    let playTimeString = viewModel.getPlayTimeString(current: current, total: total)
    XCTAssertEqual("01:40", playTimeString.currentTime)
    XCTAssertEqual("00:50", playTimeString.remainTime)
  }
}
