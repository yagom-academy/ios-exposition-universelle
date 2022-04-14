//
//  UIViewController+Extension.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/14.
//

import UIKit

protocol UIViewControllerable {
  var alertBuilder: AlertBuilderable { get }
}

extension UIViewController: UIViewControllerable {
  static var identifier: String {
    return String(describing: self)
  }
  
  var alertBuilder: AlertBuilderable {
    AlertBuilder(viewController: self)
  }
}
