//
//  MoviePlayerViewController.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/13.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit
import MSPlayer
import AVFoundation
import AVKit
import Hero

class MoviePlayerViewController: UIViewController, UIGestureRecognizerDelegate {
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var timeDurationLabel: UILabel!
  @IBOutlet private weak var baseView: UIView!
  var videoEntity: VideoEntity?
  var heroId = ""

  private lazy var videoPlayer = {
    MSPlayer()
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.hero.isEnabled = true
    baseView.hero.id = heroId

    guard let videoEntity = videoEntity,
      let videoURL = videoEntity.videoUrl else {
      return
    }
    self.titleLabel.text = videoEntity.title
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

  @IBAction func tapCloseButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension MoviePlayerViewController: MSPlayerDelegate {
  func msPlayer(_ player: MSPlayer, stateDidChange state: MSPM.State) {
    if state == MSPM.State.playedToTheEnd {
      dismiss(animated: true, completion: nil)
    }
  }

  func msPlayer(_ player: MSPlayer, loadTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {}

  func msPlayer(_ player: MSPlayer, playTimeDidChange current: TimeInterval, total: TimeInterval) {
    let currentTimeInterval: Double = floor(current)
    let currentStr: String = currentTimeInterval.makeTimeDurationString()

    let remainTimeInterval: Double = total - currentTimeInterval
    let remainStr: String = remainTimeInterval.makeTimeDurationString()

    self.timeDurationLabel.text = currentStr + " / " + remainStr
  }

  func msPlayer(_ player: MSPlayer, isPlaying: Bool) {}

  func msPlayer(_ player: MSPlayer, orientChanged isFullScreen: Bool) {}
}
