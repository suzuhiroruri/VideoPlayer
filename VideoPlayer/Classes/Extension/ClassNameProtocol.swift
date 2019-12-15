//
//  ClassNameProtocol.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/12.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//
import Foundation

public protocol ClassNameProtocol {
  static var className: String { get }
  var className: String { get }
}

public extension ClassNameProtocol {
  static var className: String {
    String(describing: self)
  }

  var className: String {
    Self.className
  }
}

extension NSObject: ClassNameProtocol {}
