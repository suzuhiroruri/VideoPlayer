//
//  VideoListAPIFailedURLErrorTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest

class VideoListAPIFailedURLErrorTest: XCTestCase {
  private let requestAPIModel = APIModel()

  override func setUp() {
    super.setUp()

    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   statusCode: 200)
    TestStubs.setUpDownNetwork(config: testConfig, code: URLError.unknown.rawValue)
  }

  override func tearDown() {

    TestStubs.tearDown()
    super.tearDown()
  }

  func testVideoListAPIFailedURLError() {
    let expectation = self.expectation(description: "Expectation")
    requestAPIModel.videoListAPI(completion: { response in
      switch response {
      case .success:
        XCTFail("This test should be failed.")
      case .error(let error):
        switch error {
        case .apiHttpError(let status):
          XCTAssertEqual(status, URLError.unknown)
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
