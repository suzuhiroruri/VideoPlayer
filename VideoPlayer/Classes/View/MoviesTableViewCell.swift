//
//  MoviesTableViewCell.swift
//  VideoPlayer
//
//  Created by 鈴木 宏昌 on 2019/12/10.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

  @IBOutlet weak var thumbnailView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var presenterNameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
