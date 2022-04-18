//
//  UIView+.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/17.
//

import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach { view in
      addSubview(view)
    }
  }
}
