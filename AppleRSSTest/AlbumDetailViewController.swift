//
//  AlbumDetailViewController.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/19/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
  
  var album: Album?
  
  lazy var albumDetailView: AlbumDetailView = {
    let view = AlbumDetailView()
    view.albumDetailViewModel = viewModel
    view.albumDelegate = self
    return view
  }()
  
  lazy var viewModel: AlbumDetailViewModel = {
    let viewModel = AlbumDetailViewModel(album: album)
    return viewModel
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.configureAlbumInfo()
    configureContentView()
  }
  
  private func configureContentView() {
    view.backgroundColor = .white
    view.addSubview(albumDetailView)
    
    albumDetailView.translatesAutoresizingMaskIntoConstraints = false
    albumDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    albumDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    albumDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    albumDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
}

extension AlbumDetailViewController: AlbumDetailViewDelegate {
  func didTapURLButton(urlString: String) {
    guard let url = URL(string: urlString) else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
}
