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

  @IBOutlet weak var thumbnailView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var presenterNameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  func configureCell() {
    titleLabel.text = "G12 Chemistry"
    descriptionLabel.text = "90 seconds exercise for Chemistry"
    presenterNameLabel.text = "Kaoru Sakata"
    guard let url = URL(string: "https://quipper.github.io/native-technical-exam/images/sakata.jpg") else {
      return
    }
    thumbnailView.af_setImage(withURL: url)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
