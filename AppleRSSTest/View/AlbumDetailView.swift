//
//  AlbumDetailView.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/19/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

protocol AlbumDetailViewDelegate {
  func didTapURLButton(urlString: String)
}

class AlbumDetailView: UIScrollView {
  
  var albumDelegate: AlbumDetailViewDelegate?
  
  weak var albumDetailViewModel: AlbumDetailViewModel? {
    didSet {
      guard let albumDetailViewModel = albumDetailViewModel else { return }
      name.text = albumDetailViewModel.name
      artist.text = albumDetailViewModel.artistName
      releaseDate.text = albumDetailViewModel.releaseDate
      copyright.text = albumDetailViewModel.copyright
      genres.text = albumDetailViewModel.genres
      art.setImageFromURL(urlString: albumDetailViewModel.artworkUrl100)
    }
  }
  
  private var name: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()
  
  private var artist: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
  private var releaseDate: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  private var copyright: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()
  
  private var genres: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  private var art: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.setDropShadow()
    return imageView
  }()
  
  private var button: UIButton = {
    let button = UIButton()
    button.setTitleColor(.black, for: .normal)
    button.setTitle("Open in iTunes", for: .normal)
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(openInItunesButtonTapped), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(name)
    addSubview(artist)
    addSubview(art)
    
    addSubview(releaseDate)
    addSubview(genres)
    addSubview(copyright)
    addSubview(button)
    
    setupArtAnchors()
    setupNameAnchors()
    setupArtistAnchors()
    setupReleaseDateAnchors()
    setupGenresAnchors()
    setupCopyrightAnchors()
    setupButtonAnchors()
  }
  
  private func setupArtAnchors() {
    art.translatesAutoresizingMaskIntoConstraints = false
    art.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    art.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
    art.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
    
    art.widthAnchor.constraint(equalTo: widthAnchor, constant: -64).isActive = true
  }
  
  private func setupNameAnchors() {
    name.translatesAutoresizingMaskIntoConstraints = false
    name.topAnchor.constraint(equalTo: art.bottomAnchor, constant: 16).isActive = true
    name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  private func setupArtistAnchors() {
    artist.translatesAutoresizingMaskIntoConstraints = false
    artist.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16).isActive = true
    artist.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    artist.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  private func setupReleaseDateAnchors() {
    releaseDate.translatesAutoresizingMaskIntoConstraints = false
    releaseDate.topAnchor.constraint(equalTo: artist.bottomAnchor, constant: 16).isActive = true
    releaseDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    releaseDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  private func setupGenresAnchors() {
    genres.translatesAutoresizingMaskIntoConstraints = false
    genres.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 16).isActive = true
    genres.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    genres.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  private func setupCopyrightAnchors() {
    copyright.translatesAutoresizingMaskIntoConstraints = false
    copyright.topAnchor.constraint(equalTo: genres.bottomAnchor, constant: 32).isActive = true
    copyright.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    copyright.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  private func setupButtonAnchors() {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.topAnchor.constraint(equalTo: copyright.bottomAnchor, constant: 20).isActive = true
    button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    button.heightAnchor.constraint(equalToConstant: 40)
  }
  
  @objc
  private func openInItunesButtonTapped() {
    guard let albumDelegate = albumDelegate,
      let albumDetailViewModel = albumDetailViewModel else { return }
    albumDelegate.didTapURLButton(urlString: albumDetailViewModel.url)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
