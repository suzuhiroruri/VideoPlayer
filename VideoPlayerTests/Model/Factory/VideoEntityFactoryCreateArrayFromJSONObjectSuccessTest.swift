//
//  VideoEntityFactoryCreateArrayFromJSONObjectSuccessTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON

class VideoEntityFactoryCreateArrayFromJSONObjectSuccessTest: XCTestCase {
  private let requestAPIModel = APIModel()
  private lazy var json: JSON = uninitialized()

  override func setUp() {
    super.setUp()

    guard let json = ModelTestConfigration.getTestJSON(jsonFileType: .videoEntityFactoryCreateArrayFromJSONObjectSuccessTest) else {
      XCTFail("Json failure")
      return
    }

    self.json = json
  }

  override func tearDown() {
    TestStubs.tearDown()
    super.tearDown()
  }

  func testCreateArrayFromJSONObjectSuccess() {
    let videoEntityFactory = VideoEntityFactory.sharedInstance
    let videoEntityArray: [VideoEntity] = videoEntityFactory.createArrayFromJSONObject(json: json)

    for (index, videoEntity) in videoEntityArray.enumerated() {
      if index == 0 {
        XCTAssertEqual("G12 Chemistry", videoEntity.title)
        XCTAssertEqual("Kaoru Sakata", videoEntity.presenterName)
        XCTAssertEqual("90 seconds exercise for Chemistry", videoEntity.description)
        guard let thumbnailUrl = URL(string: "https://quipper.github.io/native-technical-exam/images/sakata.jpg"),
          let videoEntityThumbnailUrl = videoEntity.thumbnailUrl else {
          return
        }
        XCTAssertEqual(thumbnailUrl, videoEntityThumbnailUrl)
        guard let videoUrl = URL(string: "https://quipper.github.io/native-technical-exam/videos/sakata.mp4"),
          let videoEntityVideoUrl = videoEntity.videoUrl else {
          XCTFail("Unwrap error")
          return
        }
        XCTAssertEqual(videoUrl, videoEntityVideoUrl)
        XCTAssertEqual(Double(97000) / 1000, videoEntity.videoDuration)
      } else if index == 1 {
        XCTAssertEqual("G12 Japanese Classics", videoEntity.title)
        XCTAssertEqual("Rina Okamoto", videoEntity.presenterName)
        XCTAssertEqual("90 seconds exercise for Japanese Classics", videoEntity.description)
        guard let thumbnailUrl = URL(string: "https://quipper.github.io/native-technical-exam/images/okamoto.jpg"),
          let videoEntityThumbnailUrl = videoEntity.thumbnailUrl else {
          XCTFail("Unwrap error")
          return
        }
        XCTAssertEqual(thumbnailUrl, videoEntityThumbnailUrl)
        guard let videoUrl = URL(string: "https://quipper.github.io/native-technical-exam/videos/okamoto.mp4"),
          let videoEntityVideoUrl = videoEntity.videoUrl else {
          return
        }
        XCTAssertEqual(videoUrl, videoEntityVideoUrl)
        XCTAssertEqual(Double(75000) / 1000, videoEntity.videoDuration)
      }
    }
  }
}
