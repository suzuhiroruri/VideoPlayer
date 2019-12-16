//
//  Double+Test2.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest

class DoubleExtensionTest2: XCTestCase {
  private var doubleNum: Double = 0.0

  override func setUp() {
    super.setUp()
    doubleNum = 1234.5
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    let resultString = doubleNum.makeTimeDurationString()
    XCTAssertEqual("20:34", resultString)
  }
}
