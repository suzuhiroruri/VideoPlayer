//
//  ListViewController.swift
//  VideoPlayer
//
//  Created by Quipper Ltd. on 9/16/19.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  private var activityIndicatorView: NVActivityIndicatorView!

  private let viewModel = ListViewModel()

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
                                                    type: NVActivityIndicatorType.lineScale,
                                                    color: UIColor.black, padding: 0)
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

  private func register() {
    tableView.register(R.nib.moviesTableViewCell(), forCellReuseIdentifier: "MovieCell")
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
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.videoEntityArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MoviesTableViewCell else {
      return UITableViewCell()
    }
    let videoEntity: VideoEntity = viewModel.videoEntityArray[indexPath.row]
    movieCell.configureCell(videoEntity: videoEntity)
    return movieCell
  }
}
