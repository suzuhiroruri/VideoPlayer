//
//  Double+.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/15.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit

extension Double {
  func makeTimeDurationString() -> String {
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = "mm:ss"

    guard self > 0.0 else {
      return "00:00"
    }

    let timeDurationDate: Date = Date(timeIntervalSinceReferenceDate: self)
    let timeDurationString: String = formatter.string(from: timeDurationDate)
    return timeDurationString
  }
}
