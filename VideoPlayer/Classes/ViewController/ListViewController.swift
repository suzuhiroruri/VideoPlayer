//
//  ListViewController.swift
//  VideoPlayer
//
//  Created by Quipper Ltd. on 9/16/19.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!

  private let viewModel = ListViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    register()
    tableView.delegate = self
    tableView.dataSource = self

    tableView.tableFooterView = UIView()

    viewModel.loadNew(completion: { [weak self] response in
      guard let self = self else {
        return
      }
      switch response {
      case true:
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      case false:
        break
      }
    })
  }

  private func register() {
    tableView.register(R.nib.moviesTableViewCell(), forCellReuseIdentifier: "MovieCell")
  }
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MoviesTableViewCell else {
      return UITableViewCell()
    }
    movieCell.configureCell()
    return movieCell
  }
}
