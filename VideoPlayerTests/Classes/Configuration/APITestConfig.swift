//
//  APITestConfig.swift
//  VideoPlayerTests
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki. All rights reserved.
//

import Foundation
import OHHTTPStubs

/// TestStubs.APIType Equatable
func==(lhs: TestStubs.APIType, rhs: TestStubs.APIType) -> Bool {
  switch (lhs, rhs) {
  case (.appAPIHost, .appAPIHost):
    return true
  case (.appAPIPath(let lhsValue), .appAPIPath(let rhsValue)) where lhsValue == rhsValue:
    return true
  default:
    return false
  }
}

/// Stub setting class
struct APITestConfig {

  let apiType: TestStubs.APIType
  let jsonFileType: TestStubs.JsonFileType?
  let jsonData: Data?
  let statusCode: Int
  let headers: [AnyHashable: Any]?
  let requestTime: TimeInterval
  let responseTime: TimeInterval

  init(apiType: TestStubs.APIType,
       jsonFileType: TestStubs.JsonFileType? = nil,
       jsonData: Data? = nil,
       statusCode: Int,
       headers: [AnyHashable: Any]? = nil,
       requestTime: TimeInterval = 0,
       responseTime: TimeInterval = 0) {

    self.apiType = apiType
    self.jsonFileType = jsonFileType
    self.jsonData = jsonData
    self.statusCode = statusCode
    self.headers = headers
    self.requestTime = requestTime
    self.responseTime = responseTime
  }
}
