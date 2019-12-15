//
//  VideoPlayerViewController.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 2019/12/13.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit
import MSPlayer
import Hero

class VideoPlayerViewController: UIViewController, UIGestureRecognizerDelegate {
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

    setupMSPlayerConfig()
    setupVideoPlayerView()
    setupVideoResource()
  }

  private func setupMSPlayerConfig() {
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
  }
    
  private func setupVideoPlayerView() {
    videoPlayer.delegate = self
    baseView.addSubview(videoPlayer)
    videoPlayer.translatesAutoresizingMaskIntoConstraints = false
    videoPlayer.topAnchor.constraint(equalTo: self.baseView.topAnchor).isActive = true
    videoPlayer.bottomAnchor.constraint(equalTo: self.baseView.bottomAnchor).isActive = true
    videoPlayer.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor).isActive = true
    videoPlayer.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor).isActive = true
  }

  private func setupVideoResource() {
    guard let videoEntity = videoEntity,
      let videoURL = videoEntity.videoUrl else {
      return
    }
    self.titleLabel.text = videoEntity.title
    let resourceDefinition = MSPlayerResourceDefinition(videoId: videoURL.absoluteString,
                                                        videoName: videoEntity.title,
                                                        url: videoURL,
                                                        definition: "",
                                                        coverURLRequest: nil)
    let asset = MSPlayerResource(definitions: [resourceDefinition])
    videoPlayer.setVideoBy(asset)
  }

  @IBAction func tapCloseButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension VideoPlayerViewController: MSPlayerDelegate {
  func msPlayer(_ player: MSPlayer, stateDidChange state: MSPM.State) {
    guard state == MSPM.State.playedToTheEnd else {
      return
    }
    dismiss(animated: true, completion: nil)
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
