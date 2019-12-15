//
//  VideoEntityFactoryCreateArrayFromJSONObjectSuccessEmpty.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoEntityFactoryCreateArrayFromJSONObjectSuccessEmpty: XCTestCase {
  let requestAPIModel = APIModel()
  lazy var json: JSON = uninitialized()

  override func setUp() {
    super.setUp()

    // JSONを取得
    guard let json = ModelTestConfigration.getTestJSON(jsonFileType: .videoEntityFactoryCreateArrayFromJSONObjectSuccessEmpty) else {
      XCTFail("Json failure")
      return
    }

    self.json = json
  }

  override func tearDown() {
    TestStubs.tearDown()
    super.tearDown()
  }

  func testCreateArrayFromJSONObjectSuccessEmpty() {
    let videoEntityFactory = VideoEntityFactory.sharedInstance
    let videoEntityArray: [VideoEntity] = videoEntityFactory.createArrayFromJSONObject(json: json)

    guard videoEntityArray.isEmpty else {
      XCTFail("Video entity array is not empty.")
      return
    }
    XCTAssertTrue(true, "Expected.")
  }
}

