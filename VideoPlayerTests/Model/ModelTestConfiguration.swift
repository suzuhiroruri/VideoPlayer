//
//  ModelTestConfiguration.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import SwiftyJSON

func uninitialized<T>() -> T { fatalError() }

class ModelTestConfigration {
  /// making json data from bundle file
  ///
  /// - Parameter jsonFileType: file type
  /// - Returns: JSON?
  static func getTestJSON(jsonFileType: ModelTestConfigration.JsonFileType) -> JSON? {
    let testBundle = Bundle(for: TestStubs.self)
    if let jsonPath = testBundle.path(forResource: jsonFileType.rawValue, ofType: "json") {
      let url = URL(fileURLWithPath: jsonPath)
      if let jsonData = try? Data(contentsOf: url) {
        return try? JSON(data: jsonData)
      }
    }
    return nil
  }
}

extension ModelTestConfigration {
  enum JsonFileType: String {
    case videoEntityFactoryCreateArrayFromJSONObjectSuccess = "VideoEntityFactoryCreateArrayFromJSONObjectSuccess"
    case videoEntityFactoryCreateArrayFromJSONObjectSuccessEmpty = "VideoEntityFactoryCreateArrayFromJSONObjectSuccessEmpty"
  }
}
