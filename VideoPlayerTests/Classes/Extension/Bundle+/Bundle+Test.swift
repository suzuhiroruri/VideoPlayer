//
//  Bundle+Test.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest

class BundleExtensionTest: XCTestCase {
  private var doubleNum: Double = 0.0

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test() {
    let resultString = Bundle.ServerString(key: .appApiHost)
    XCTAssertEqual("quipper.github.io", resultString)
  }
}
