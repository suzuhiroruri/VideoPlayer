//
//  VPError.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import Foundation

enum VPError: Error {
  case success
  case apiDataNotFound
  case apiServerUnknownError
  case apiHttpError(status: URLError.Code)
  case apiInvalidJSON
  case apiInternetNotConnect
}
