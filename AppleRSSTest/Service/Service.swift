//
//  Service.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/17/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import Foundation

class Service {
  static let shared = Service()
  
  func fetchAlbumsData(_ completionHandler: @escaping(Result<Feed?, Error>) -> ()) {
    let urlString: String = "https://rss.itunes.apple.com/api/v1/us/apple-music/new-releases/all/50/explicit.json"
    
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      if let error = error {
        completionHandler(.failure(error))
        return
      }
      guard let data = data else {
        completionHandler(.success(nil))
        return
      }
      do {
        let albumsFeed = try JSONDecoder().decode(FeedResponse.self, from: data)
        DispatchQueue.main.async(execute: {
          completionHandler(.success(albumsFeed.feed))
        })
      } catch let jsonError {
        completionHandler(.failure(jsonError))
      }
    }.resume()
  }
}
