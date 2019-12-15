//
//  MovieListViewController.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 9/16/19.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MovieListViewController: UIViewController {
  @IBOutlet private weak var tableView: UITableView!
  private var activityIndicatorView: NVActivityIndicatorView!

  private let viewModel = MovieListViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()

    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 2, height: 5))
    imageView.contentMode = .scaleAspectFit
    guard let logo = R.image.logo() else {
      return
    }
    imageView.image = logo
    self.navigationItem.titleView = imageView

    register()
    tableView.delegate = self
    tableView.dataSource = self

    tableView.tableFooterView = UIView()

    // indicator setting
    activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50),
                                                    type: NVActivityIndicatorType.ballRotateChase,
                                                    color: UIColor.quipperBlueColor(), padding: 0)
    activityIndicatorView.center = self.view.center
    view.addSubview(activityIndicatorView)

    startIndicator()
    viewModel.loadNew(completion: { [weak self] response in
      guard let self = self else {
        return
      }
      switch response {
      case true:
        DispatchQueue.main.async {
          self.tableView.reloadData()
          self.stopIndicator()
        }

      case false:
        self.stopIndicator()
      }
    })
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedIndexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedIndexPath, animated: animated)
    }
    UIDevice.current.setValuesForKeys(["orientation": UIInterfaceOrientation.portrait.rawValue])
  }

  private func register() {
    tableView.register(cellType: MovieTableViewCell.self)
  }

  private func startIndicator() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else {
        return
      }
      self.activityIndicatorView.startAnimating()
    }
  }

  private func stopIndicator() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else {
        return
      }
      self.activityIndicatorView.stopAnimating()
    }
  }

  fileprivate func playMovieFromUrl(movieURL: URL) {}
}

extension MovieListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return MovieTableViewCell.cellHeight
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let videoEntity: VideoEntity = viewModel.videoEntityArray[indexPath.row]
    guard let movieController = R.storyboard.moviePlayer().instantiateInitialViewController() as? MoviePlayerViewController, let thumbnailUrl = videoEntity.thumbnailUrl else {
      return
    }
    movieController.heroId = "MovieTableViewCell_thumbnailView" + thumbnailUrl.description
    movieController.videoEntity = videoEntity
    movieController.modalPresentationStyle = .fullScreen
    present(movieController, animated: true, completion: nil)
  }
}

extension MovieListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.videoEntityArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movieCell = tableView.dequeueReusableCell(with: MovieTableViewCell.self, for: indexPath)
    let videoEntity: VideoEntity = viewModel.videoEntityArray[indexPath.row]
    movieCell.configureCell(videoEntity: videoEntity)
    return movieCell
  }
}
