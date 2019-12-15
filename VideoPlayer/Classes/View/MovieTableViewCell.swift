//
//  MovieTableViewCell.swift
//  VideoPlayer
//
//  Created by 鈴木 宏昌 on 2019/12/10.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit
import AlamofireImage
import Hero

class MovieTableViewCell: UITableViewCell {

  static let cellHeight: CGFloat = 100

  @IBOutlet private weak var thumbnailView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var presenterNameLabel: UILabel!

  var heroId = ""

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
    heroId = "MovieTableViewCell_thumbnailView" + thumbnailUrl.description
    thumbnailView.hero.id = heroId
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
