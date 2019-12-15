//
//  UIColor+.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/13.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit

extension UIColor {
  class func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return rgba(red, green: green, blue: blue, alpha: 1)
  }

  class func rgba(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    var red = red > 255 ? 255 : red
    red = red < 0 ? 0 : red
    var green = green > 255 ? 255 : green
    green = green < 0 ? 0 : green
    var blue = blue > 255 ? 255 : blue
    blue = blue < 0 ? 0 : blue

    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
  }

  class func quipperBlueColor() -> UIColor {
    return UIColor.rgb(0, green: 190, blue: 255)
  }
}
