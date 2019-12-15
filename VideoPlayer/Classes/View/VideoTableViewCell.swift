//
//  VideoTableViewCell.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/10.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit
import AlamofireImage
import Hero

class VideoTableViewCell: UITableViewCell {

  static let cellHeight: CGFloat = 100

  @IBOutlet private weak var totalTimeLabel: UILabel!
  @IBOutlet private weak var thumbnailView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var presenterNameLabel: UILabel!

  var heroId = ""

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    descriptionLabel.text = nil
    presenterNameLabel.text = nil
    totalTimeLabel.text = nil
    thumbnailView.image = nil
  }

  func configureCell(videoEntity: VideoEntity) {
    titleLabel.text = videoEntity.title
    descriptionLabel.text = videoEntity.description
    presenterNameLabel.text = videoEntity.presenterName
    guard let thumbnailUrl = videoEntity.thumbnailUrl else {
      return
    }
    thumbnailView.af_setImage(withURL: thumbnailUrl)
    heroId = "VideoTableViewCell_thumbnailView" + thumbnailUrl.description
    thumbnailView.hero.id = heroId

    totalTimeLabel.text = videoEntity.videoDuration.makeTimeDurationString()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
