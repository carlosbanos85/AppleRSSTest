//
//  AlbumTableViewCell.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/18/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

  static let cellIdentifier = "AlbumTableViewCell"
  
  var album: Album? {
    didSet {
      guard let album = album else { return }
      name.text = album.name
      artist.text = album.artistName
      art.setImageFromURL(urlString: album.artworkUrl100)
      accessoryType = .disclosureIndicator
    }
  }
  
  private var name: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
  private var artist: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12)
    return label
  }()
  
  private var art: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(name)
    addSubview(artist)
    addSubview(art)
    
    setupArtAnchors()
    setupNameAnchors()
    setupArtistAnchors()
  }
  
  private func setupArtAnchors() {
    art.translatesAutoresizingMaskIntoConstraints = false
    art.widthAnchor.constraint(equalToConstant: 100).isActive = true
    art.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    art.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    art.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
    art.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
  }

  private func setupNameAnchors() {
    name.translatesAutoresizingMaskIntoConstraints = false
    name.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    name.leadingAnchor.constraint(equalTo: art.trailingAnchor, constant: 8).isActive = true
    name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
  }
  
  private func setupArtistAnchors() {
    artist.translatesAutoresizingMaskIntoConstraints = false
    artist.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
    artist.leadingAnchor.constraint(equalTo: art.trailingAnchor, constant: 8).isActive = true
    artist.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
