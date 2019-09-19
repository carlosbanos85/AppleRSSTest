//
//  Album.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/17/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

class Album: Decodable {
  private (set) var id: String
  private (set) var name: String
  private (set) var artistName: String
  private (set) var releaseDate: String
  private (set) var kind: String
  private (set) var copyright: String
  private (set) var artistId: String
  private (set) var contentAdvisoryRating: String?
  private (set) var artistUrl: String
  private (set) var artworkUrl100: String
  private (set) var genres: [Genres]
  private (set) var url: String
}
