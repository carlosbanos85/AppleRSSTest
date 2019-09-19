//
//  AlbumsFeedTableViewController.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/18/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

class AlbumsFeedTableViewController: UITableViewController {
  
  let feedDataSource = FeedDataSource()
  
  lazy var viewModel: AlbumsFeedViewModel = {
    let viewModel = AlbumsFeedViewModel(feedDataSource: feedDataSource)
    return viewModel
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTable()
    configureNavigationBar()
    
    viewModel.fetchAlbumsData() { [weak self] in
      self?.tableView.reloadData()
    }
  }
  
  private func configureTable() {
    tableView.register(AlbumTableViewCell.self,
                       forCellReuseIdentifier: AlbumTableViewCell.cellIdentifier)
    tableView.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    tableView.tableFooterView = UIView()
    tableView.dataSource = feedDataSource
  }
  
  private func configureNavigationBar() {
    navigationItem.title = "Apple RSS Feed"
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = AlbumDetailViewController()
    viewController.album = feedDataSource.feed?.albums[indexPath.row]
    guard let navigationController = navigationController else { return }
    navigationController.pushViewController(viewController, animated: true)
  }
}
