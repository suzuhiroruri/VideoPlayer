//
//  VideoListAPISuccessWithDataTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import VideoPlayer

class VideoListAPISuccessWithDataTest: XCTestCase {
  private let requestAPIModel = APIModel()

  override func setUp() {
    super.setUp()

    // API test setting
    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   jsonFileType: .videoListFillData,
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
        for (index, subJson): (String, JSON) in json {
          if index == "0" {
            XCTAssertEqual("First Title", subJson["title"].stringValue)
            XCTAssertEqual("Hiromasa Suzuki", subJson["presenter_name"].stringValue)
            XCTAssertEqual("Let's play dance!", subJson["description"].stringValue)
            XCTAssertEqual("https://suzuhiroruri.github.io/resources/images/shore.png", subJson["thumbnail_url"].stringValue)
            XCTAssertEqual("https://suzuhiroruri.github.io/resources/videos/shore.mp4", subJson["video_url"].stringValue)
            XCTAssertEqual(97000, subJson["video_duration"].intValue)
          } else if index == "1" {
            XCTAssertEqual("Second Title", subJson["title"].stringValue)
            XCTAssertEqual("Masahiro Suzumoto", subJson["presenter_name"].stringValue)
            XCTAssertEqual("This is the best movie!", subJson["description"].stringValue)
            XCTAssertEqual("https://suzuhiroruri.github.io/resources/images/shore.png", subJson["thumbnail_url"].stringValue)
            XCTAssertEqual("https://suzuhiroruri.github.io/resources/videos/shore.mp4", subJson["video_url"].stringValue)
            XCTAssertEqual(75000, subJson["video_duration"].intValue)
          }
        }
      case .error:
        XCTFail("failure")
      }
      expectation.fulfill()
    })
    waitForExpectations(timeout: 10) { (error) in
    }
  }
}
