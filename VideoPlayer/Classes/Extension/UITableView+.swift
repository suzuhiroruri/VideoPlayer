//
//  tableView+.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/12.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//
import UIKit
import Foundation

extension UITableView {
  public func register(cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
    let className = cellType.className
    let nib = UINib(nibName: className, bundle: bundle)
    register(nib, forCellReuseIdentifier: className)
  }

  public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
    // swiftlint:disable force_cast
    dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    // swiftlint:enable force_cast
  }
}
