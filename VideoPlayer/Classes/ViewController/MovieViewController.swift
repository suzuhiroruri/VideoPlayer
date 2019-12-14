//
//  MovieViewController.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/13.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit
import ASPVideoPlayer
import AVFoundation
import AVKit

class MovieViewController: UIViewController {
  @IBOutlet weak var videoPlayer: ASPVideoPlayer!
  private var player: AVPlayer!
  var videoEntity: VideoEntity?

  var isPlaying = true
  var isEnding = false

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let videoEntity = videoEntity,
      let videoURL = videoEntity.videoUrl else {
      return
    }
    self.title = videoEntity.title
    let asset = AVURLAsset(url: videoURL)
    videoPlayer.videoAssets = [asset]
    videoPlayer.delegate = self
  }

  @IBAction func tapCloseButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
}

extension MovieViewController: ASPVideoPlayerViewDelegate {
  func playingVideo(progress: Double) {
    print("Playing: \(progress)")
  }
}
