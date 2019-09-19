//
//  UIView+Extensions.swift
//  AppleRSSTest
//
//  Created by Carlos Banos on 9/19/19.
//  Copyright © 2019 Carlos Banos. All rights reserved.
//

import UIKit

extension UIView {
  func setDropShadow() {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 10
    layer.shadowOpacity = 0.6
  }
}
