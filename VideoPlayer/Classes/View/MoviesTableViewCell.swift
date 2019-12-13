//
//  MoviesTableViewCell.swift
//  VideoPlayer
//
//  Created by 鈴木 宏昌 on 2019/12/10.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesTableViewCell: UITableViewCell {

  static let cellHeight: CGFloat = 100

  @IBOutlet weak var thumbnailView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var presenterNameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  func configureCell(videoEntity: VideoEntity) {
    titleLabel.text = videoEntity.title
    descriptionLabel.text = videoEntity.description
    presenterNameLabel.text = videoEntity.presenterName
    guard let thumbnailUrl = videoEntity.thumbnailUrl else {
      return
    }
    thumbnailView.af_setImage(withURL: thumbnailUrl)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
