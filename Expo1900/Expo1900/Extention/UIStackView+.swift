//
//  UIStackView+.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/17.
//

import UIKit

extension UIStackView {
  func addArrangedSubviews(_ views: UIView...) {
   views.forEach { view in
      addArrangedSubview(view)
    }
  }
}
