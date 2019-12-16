//
//  VideoListAPIFailedEmptyTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoListAPIFailedEmptyTest: XCTestCase {
  private let requestAPIModel = APIModel()

  override func setUp() {
    super.setUp()

    // API test setting
    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   jsonFileType: .videoListAPISuccessEmptyTest,
                                   statusCode: 200)
    TestStubs.setUp(config: testConfig)
  }

  override func tearDown() {
    TestStubs.tearDown()
    super.tearDown()
  }

  func testVideoListAPI() {
    let expectation = self.expectation(description: "Expectation")
    requestAPIModel.videoListAPI(completion: { response in
      switch response {
      case .success(let json):
        guard json.isEmpty else {
          XCTFail("Json is not empty")
          return
        }
        XCTAssertTrue(true, "Success in empty test.")
      case .error:
        XCTFail("Unexpected error.")
      }
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30) { (error) in
    }
  }
}
