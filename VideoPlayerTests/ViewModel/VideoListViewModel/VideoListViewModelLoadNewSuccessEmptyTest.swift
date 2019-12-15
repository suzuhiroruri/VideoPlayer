//
//  VideoListViewModelLoadNewSuccessEmptyTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoListViewModelLoadNewSuccessEmptyTest: XCTestCase {
  let viewModel = VideoListViewModel()
  override func setUp() {
    super.setUp()

    // API test setting
    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   jsonFileType: .videoListViewModelLoadNewSuccessEmptyTest,
                                   statusCode: 200)
    TestStubs.setUp(config: testConfig)
  }

  override func tearDown() {
    TestStubs.tearDown()
    super.tearDown()
  }

  func testVideoListViewModelLoadNewSuccess() {
    let expectation = self.expectation(description: "Expectation")
    viewModel.loadNew(completion: { response in
      switch response {
      case true:
        XCTAssertTrue(true, "VideoListViewModelLoadNewSuccess")
      case false:
        XCTFail("Unexpected error.")
      }
      expectation.fulfill()
    })
    waitForExpectations(timeout: 10) { (error) in
    }
  }
}
