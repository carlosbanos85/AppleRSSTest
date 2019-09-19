//
//  FeedDataSource.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/18/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

class FeedDataSource: NSObject, UITableViewDataSource {
  
  var feed: Feed?
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let feed = feed else { return 0 }
    return feed.albums.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let feed = feed,
      let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.cellIdentifier,
                                               for: indexPath) as? AlbumTableViewCell else { return AlbumTableViewCell() }
    
    cell.album = feed.albums[indexPath.row]
    return cell
  }
}
