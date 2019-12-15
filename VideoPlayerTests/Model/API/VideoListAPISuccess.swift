//
//  VideoListAPISuccess.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoListAPISuccess: XCTestCase {
  let requestAPIModel = APIModel()

  override func setUp() {
    super.setUp()

    // API test setting
    let testConfig = APITestConfig(apiType: .appAPIHost,
                                   jsonFileType: .videoListAPISuccess,
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
            XCTAssertEqual("G12 Chemistry", subJson["title"].stringValue)
            XCTAssertEqual("Kaoru Sakata", subJson["presenter_name"].stringValue)
            XCTAssertEqual("90 seconds exercise for Chemistry", subJson["description"].stringValue)
            XCTAssertEqual("https://quipper.github.io/native-technical-exam/images/sakata.jpg", subJson["thumbnail_url"].stringValue)
            XCTAssertEqual("https://quipper.github.io/native-technical-exam/videos/sakata.mp4", subJson["video_url"].stringValue)
            XCTAssertEqual(97000, subJson["video_duration"].intValue)
          } else if index == "1" {
            XCTAssertEqual("G12 Japanese Classics", subJson["title"].stringValue)
            XCTAssertEqual("Rina Okamoto", subJson["presenter_name"].stringValue)
            XCTAssertEqual("90 seconds exercise for Japanese Classics", subJson["description"].stringValue)
            XCTAssertEqual("https://quipper.github.io/native-technical-exam/images/okamoto.jpg", subJson["thumbnail_url"].stringValue)
            XCTAssertEqual("https://quipper.github.io/native-technical-exam/videos/okamoto.mp4", subJson["video_url"].stringValue)
            XCTAssertEqual(75000, subJson["video_duration"].intValue)
          }
        }
        expectation.fulfill()
      case .error:
        fatalError("通信が失敗してます！")
      }

    })
    waitForExpectations(timeout: 10) { (error) in
    }
  }
}
