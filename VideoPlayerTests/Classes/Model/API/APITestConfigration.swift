//
//  APITestConfigration.swift
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

/// API Test Stubs
class TestStubs {

  /// api type
  enum APIType {
    /// app api
    case appAPIHost
    /// identity api path
    case appAPIPath(APIModel.APIName)
  }

  /// return testing api name(Host or Path)
  ///
  /// - Parameter apiType: testing api type
  /// - Returns: host name
  static func testType(apiType: APIType) -> String {
    return Bundle.ServerString(key: .appApiHost)
  }

  /// read json data form json file
  ///
  /// - Parameters:
  ///   - config: configuration
  static func setUp(config: APITestConfig) {

    var tmpData = config.jsonData

    if tmpData == nil,
      let jsonFileType = config.jsonFileType,
      let data = TestStubs.getTestJSON(jsonFileType: jsonFileType) {
      tmpData = data
    }

    guard let data = tmpData else {
      fatalError("No json Data")
    }

    let api = TestStubs.testType(apiType: config.apiType)

    let condition: OHHTTPStubsTestBlock

    switch config.apiType {
    case .appAPIHost:
      condition = isHost(api)
    case .appAPIPath:
      condition = isPath(api)
    }

    stub(condition: condition) { _ in
      OHHTTPStubsResponse(data: data, statusCode: Int32(config.statusCode),
                          headers: config.headers).requestTime(config.requestTime, responseTime: config.responseTime)
    }
  }

  /// stud set up of network error test
  ///
  /// - Parameters:
  ///   - config: configuration
  ///   - domain: domain
  ///   - code: error code
  static func setUpDownNetwork(config: APITestConfig,
                               domain: String = NSURLErrorDomain,
                               code: Int = URLError.notConnectedToInternet.rawValue) {

    let api = TestStubs.testType(apiType: config.apiType)

    let condition: OHHTTPStubsTestBlock

    switch config.apiType {
    case .appAPIHost:
      condition = isHost(api)
    case .appAPIPath:
      condition = isPath(api)
    }

    stub(condition: condition) { _ in
      let notConnectedError = NSError(domain: domain, code: code)
      return OHHTTPStubsResponse(error: notConnectedError)
    }
  }

  /// make json data from bundle file
  ///
  /// - Parameter jsonFileType: file type
  /// - Returns: Data?
  static func getTestJSON(jsonFileType: TestStubs.JsonFileType) -> Data? {
    let testBundle = Bundle(for: TestStubs.self)
    if let jsonPath = testBundle.path(forResource: jsonFileType.rawValue, ofType: ".json") {
      let url = URL(fileURLWithPath: jsonPath)
      if let jsonData = try? Data(contentsOf: url) {
        return jsonData
      }
    }
    return nil
  }

  /// required: call at end of test
  static func tearDown() {
    OHHTTPStubs.removeAllStubs()
  }
}

extension TestStubs {
  /// read file type form bundle
  enum JsonFileType: String {
    case videoListAPISuccessWithDataTest = "VideoListAPISuccessWithDataTest"
    case videoListAPISuccessWithEmptyDataTest = "VideoListAPISuccessWithEmptyDataTest"
    case videoListViewModelLoadNewSuccessWithDataTest = "VideoListViewModelLoadNewSuccessWithDataTest"
    case videoListViewModelLoadNewSuccessWithEmptyDataTest = "VideoListViewModelLoadNewSuccessWithEmptyDataTest"
  }
}
