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

    viewModel.loadNew()
  }

  private func register() {
    tableView.register(R.nib.moviesTableViewCell(), forCellReuseIdentifier: "MovieCell")
  }
}

extension ListViewController: UITableViewDelegate {}

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let groupTopCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MoviesTableViewCell else {
      return UITableViewCell()
    }
    return groupTopCell
  }
}
