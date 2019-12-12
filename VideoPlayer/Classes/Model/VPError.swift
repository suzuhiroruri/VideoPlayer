//
//  VPError.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/11.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import Foundation

enum VPError: Error {
  case success
  case apiDataNotFound
  case apiUnkownError
  case apiServerUnknownError
}
