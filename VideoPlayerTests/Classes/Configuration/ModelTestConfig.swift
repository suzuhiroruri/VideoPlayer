//
//  ModelTestConfig.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import SwiftyJSON

func uninitialized<T>() -> T { fatalError() }

class ModelTestConfig {
  /// making json data from bundle file
  ///
  /// - Parameter jsonFileType: file type
  /// - Returns: JSON?
  static func getTestJSON(jsonFileType: TestStubs.JsonFileType) -> JSON? {
    let testBundle = Bundle(for: TestStubs.self)
    guard let jsonPath = testBundle.path(forResource: jsonFileType.rawValue, ofType: "json") else {
      return nil
    }
    let url = URL(fileURLWithPath: jsonPath)
    guard let jsonData = try? Data(contentsOf: url) else {
      return nil
    }
    return try? JSON(data: jsonData)
  }
}
