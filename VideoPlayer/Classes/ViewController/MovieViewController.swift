//
//  MovieViewController.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/13.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit
import AVKit
class MovieViewController: UIViewController {

  @IBOutlet weak var playerView: PlayerView!
  var videoEntity: VideoEntity?

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let videoEntity = videoEntity,
      let videoURL = videoEntity.videoUrl else {
      return
    }
    self.title = videoEntity.title
    let asset = AVAsset(url: videoURL)
    let playerItem = AVPlayerItem(asset: asset)

    let player = AVPlayer(playerItem: playerItem)
    playerView.player = player
    player.play()
  }

  @IBAction func tapCloseButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
}
