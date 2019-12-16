//
//  VideoListViewModelLoadNewErrorTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/16.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoListViewModelLoadNewErrorTest: XCTestCase {
  private let viewModel = VideoListViewModel()
  override func setUp() {
    super.setUp()

    // API test setting
    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   jsonFileType: .videoListViewModelLoadNewSuccessTest,
                                   statusCode: 200)
    TestStubs.setUpDownNetwork(config: testConfig, code: URLError.unknown.rawValue)
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
        XCTFail("Unexpected error.")
      case false:
        XCTAssertTrue(true, "VideoListViewModelLoadNewError")
      }
      expectation.fulfill()
    })
    waitForExpectations(timeout: 10) { (error) in
    }
  }
}
