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
  var movieURL: URL?

  override func viewDidLoad() {
    super.viewDidLoad()
    guard let movieURL = movieURL else {
      return
    }
    let asset = AVAsset(url: movieURL)
    let playerItem = AVPlayerItem(asset: asset)

    let player = AVPlayer(playerItem: playerItem)
    playerView.player = player
    player.play()
  }
}
