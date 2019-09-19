//
//  Feed.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/17/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import Foundation
import UIKit

class Feed: Decodable {
  private (set) var id: String
  private (set) var title: String
  private (set) var author: Author
  private (set) var copyright: String
  private (set) var country: String
  private (set) var icon: String
  private (set) var updated: String
  private (set) var albums: [Album] = []
  
  enum CodingKeys: String, CodingKey {
    case id, title, author, copyright, country, icon, updated
    case albums = "results"
  }
}
