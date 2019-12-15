//
//  VideoEntityFactoryCreateArrayFromJSONObjectFillDataTest.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import VideoPlayer

class VideoEntityFactoryCreateArrayFromJSONObjectFillDataTest: XCTestCase {
  private let requestAPIModel = APIModel()
  private lazy var json: JSON = uninitialized()

  override func setUp() {
    super.setUp()

    guard let json = ModelTestConfig.getTestJSON(jsonFileType: .videoListFillData) else {
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
        XCTAssertEqual("First Title", videoEntity.title)
        XCTAssertEqual("Hiromasa Suzuki", videoEntity.presenterName)
        XCTAssertEqual("Let's play dance!", videoEntity.description)
        guard let thumbnailUrl = URL(string: "https://suzuhiroruri.github.io/resources/images/shore.png"),
          let videoEntityThumbnailUrl = videoEntity.thumbnailUrl else {
          XCTFail("Unwrap failure")
          return
        }
        XCTAssertEqual(thumbnailUrl, videoEntityThumbnailUrl)
        guard let videoUrl = URL(string: "https://suzuhiroruri.github.io/resources/videos/shore.mp4"),
          let videoEntityVideoUrl = videoEntity.videoUrl else {
          XCTFail("Unwrap failure")
          return
        }
        XCTAssertEqual(videoUrl, videoEntityVideoUrl)
        XCTAssertEqual(Double(97000) / 1000, videoEntity.videoDuration)
      } else if index == 1 {
        XCTAssertEqual("Second Title", videoEntity.title)
        XCTAssertEqual("Masahiro Suzumoto", videoEntity.presenterName)
        XCTAssertEqual("This is the best movie!", videoEntity.description)
        guard let thumbnailUrl = URL(string: "https://suzuhiroruri.github.io/resources/images/shore.png"),
          let videoEntityThumbnailUrl = videoEntity.thumbnailUrl else {
          XCTFail("Unwrap failure")
          return
        }
        XCTAssertEqual(thumbnailUrl, videoEntityThumbnailUrl)
        guard let videoUrl = URL(string: "https://suzuhiroruri.github.io/resources/videos/shore.mp4"),
          let videoEntityVideoUrl = videoEntity.videoUrl else {
          XCTFail("Unwrap failure")
          return
        }
        XCTAssertEqual(videoUrl, videoEntityVideoUrl)
        XCTAssertEqual(Double(75000) / 1000, videoEntity.videoDuration)
      }
    }
  }
}
