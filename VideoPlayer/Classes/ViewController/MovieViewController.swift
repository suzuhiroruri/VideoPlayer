//
//  MovieViewController.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/13.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit
import MSPlayer
import AVFoundation
import AVKit

class MovieViewController: UIViewController, UIGestureRecognizerDelegate {
  @IBOutlet weak var timeDurationLabel: UILabel!
  @IBOutlet private weak var baseView: UIView!

  private lazy var videoPlayer = {
    MSPlayer()
  }()

  var formatter = DateFormatter()
  var videoEntity: VideoEntity?

  override func viewDidLoad() {
    super.viewDidLoad()

    formatter.dateFormat = "mm:ss"

    guard let videoEntity = videoEntity,
      let videoURL = videoEntity.videoUrl else {
      return
    }
    self.title = videoEntity.title
    MSPlayerConfig.openRecorder = false
    MSPlayerConfig.shouldAutoPlay = true
    MSPlayerConfig.playerPanSeekRate = 0.5
    MSPlayerConfig.playerBrightnessChangeRate = 2.0
    MSPlayerConfig.playerVolumeChangeRate = 0.5
    MSPlayerConfig.playCoverImage = nil
    MSPlayerConfig.backButtonImage = nil
    MSPlayerConfig.replayButtonImage = nil
    MSPlayerConfig.loaderTintColor = UIColor.quipperBlueColor()
    MSPlayerConfig.sliderMinTrackTintColor = UIColor.quipperBlueColor()
    MSPlayerConfig.sliderThumbImage = nil
    setupView()
    let d1 = MSPlayerResourceDefinition(videoId: videoURL.absoluteString,
                                        videoName: videoEntity.title,
                                        url: videoURL,
                                        definition: "test",
                                        coverURLRequest: nil)
    let asset = MSPlayerResource(definitions: [d1])
    videoPlayer.setVideoBy(asset)
  }

  private func setupView() {
    videoPlayer.delegate = self
    baseView.addSubview(videoPlayer)
    videoPlayer.translatesAutoresizingMaskIntoConstraints = false
    videoPlayer.topAnchor.constraint(equalTo: self.baseView.topAnchor).isActive = true
    videoPlayer.bottomAnchor.constraint(equalTo: self.baseView.bottomAnchor).isActive = true
    videoPlayer.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor).isActive = true
    videoPlayer.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor).isActive = true
  }

  @IBAction func tapCloseButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
}

extension MovieViewController: MSPlayerDelegate {
  func msPlayer(_ player: MSPlayer, stateDidChange state: MSPM.State) {
    if state == MSPM.State.playedToTheEnd {
      dismiss(animated: true, completion: nil)
    }
  }

  func msPlayer(_ player: MSPlayer, loadTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {}

  func msPlayer(_ player: MSPlayer, playTimeDidChange current: TimeInterval, total: TimeInterval) {
    let currentTimeInterval = floor(current)
    let currentDate = Date(timeIntervalSinceReferenceDate: currentTimeInterval)
    let currentStr = formatter.string(from: currentDate)

    let remainTimeInterval = total - currentTimeInterval
    let remainDate = Date(timeIntervalSinceReferenceDate: remainTimeInterval)
    let remainStr = formatter.string(from: remainDate)

    self.timeDurationLabel.text = currentStr + " / " + remainStr
  }

  func msPlayer(_ player: MSPlayer, isPlaying: Bool) {}

  func msPlayer(_ player: MSPlayer, orientChanged isFullScreen: Bool) {}
}
