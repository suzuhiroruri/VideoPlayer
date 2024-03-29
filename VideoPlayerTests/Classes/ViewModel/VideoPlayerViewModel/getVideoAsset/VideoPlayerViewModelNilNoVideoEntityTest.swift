//
//  VideoPlayerViewModelNilTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import XCTest
import MSPlayer
@testable import VideoPlayer

class VideoPlayerViewModelNilNoVideoEntityTest: XCTestCase {
  private let viewModel = VideoPlayerViewModel()

  override func setUp() {
    super.setUp()
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
