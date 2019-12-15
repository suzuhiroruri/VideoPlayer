//
//  VideoListAPIFailedTimeoutResponse.swift.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoListAPIFailedTimeoutResponse: XCTestCase {
  let requestAPIModel = APIModel()

  override func setUp() {
    super.setUp()

    // API test setting
    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   jsonFileType: .videoListAPISuccess,
                                   statusCode: 200,
                                   requestTime: 20)
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
      case .success:
        XCTFail("This test should be failed.")
      case .error(let error):
        switch error {
        case .apiHttpError(let code):
          XCTAssertEqual(code, URLError.timedOut)
        default:
          XCTFail("Unexpected error.")
        }
      }
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30) { (error) in
    }
  }
}
