//
//  AlbumsFeedViewModel.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/19/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import Foundation

struct AlbumsFeedViewModel {
  
  weak var feedDataSource: FeedDataSource?
  
  func fetchAlbumsData(completionHandler: @escaping() ->()) {
    Service.shared.fetchAlbumsData { (result) in
      switch result {
      case .failure(let error):
        print("Failed to fech data: ", error)
        break
      case .success(let feedData):
        self.feedDataSource?.feed = feedData
        break
      }
      completionHandler()
    }
  }
}
