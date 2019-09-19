//
//  AlbumDetailViewModel.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/19/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
  
  weak var album: Album?

  var name: String
  var artistName: String
  var releaseDate: String
  var copyright: String
  var artworkUrl100: String
  var genres: String
  var url: String
  
  init(album: Album?) {
    self.album = album
    name = ""
    artistName = ""
    releaseDate = ""
    copyright = ""
    artworkUrl100 = ""
    genres = ""
    url = ""
  }
  
  func configureAlbumInfo() {
    guard let album = album else { return }
    name = album.name
    url = album.url
    artistName = album.artistName
    copyright = album.copyright
    artworkUrl100 = album.artworkUrl100
    genres = parseGenresToString(genres: album.genres)
    releaseDate = parseDateToFormat(stringDate: album.releaseDate)
  }
  
  private func parseGenresToString(genres: [Genres]) -> String {
    return genres.map{ $0.name }.joined(separator: ", ")
  }
  
  private func parseDateToFormat(stringDate: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: stringDate) else { return "" }
    
    dateFormatter.dateStyle = .medium
    dateFormatter.locale = Locale(identifier: "en_US")
    return dateFormatter.string(from: date)
  }
}
