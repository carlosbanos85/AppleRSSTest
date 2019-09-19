//
//  UIImageView+Extensions.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/19/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

extension UIImageView {
  func setImageFromURL(urlString: String, placeholder: UIImage? = nil) {
    guard let url = URL(string: urlString) else { return }
    image = placeholder
    DispatchQueue.global().async { [weak self] in
      guard let data = try? Data(contentsOf: url),
        let image = UIImage(data: data) else {
        print("Photo not found")
        return
      }
      DispatchQueue.main.async {
        guard let self = self else { return }
        UIView.transition(with: self,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.image = image },
                          completion: nil)
      }
    }
  }
}
