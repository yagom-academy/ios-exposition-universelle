//
//  AlertBuilder.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/14.
//

import UIKit

struct AlertProduct {
  var title: String?
  var confirmTitle: String?
  var message: String?
}

protocol AlertPresentable {
  var alertBuilder: AlertBuilderable { get }
}

protocol AlertBuilderable {
  init(viewController: UIViewController)
  func setTitle(_ title: String) -> AlertBuilderable
  func setConfirmTitle(_ confirmTitle: String) -> AlertBuilderable
  func showAlert()
}

final class AlertBuilder: AlertBuilderable {
  private weak var viewController: UIViewController?
  private var product = AlertProduct()
  
  init(viewController: UIViewController) {
    self.viewController = viewController
  }
  
  func setTitle(_ title: String) -> AlertBuilderable {
    product.title = title
    return self
  }
  
  func setConfirmTitle(_ confirmTitle: String) -> AlertBuilderable {
    product.confirmTitle = confirmTitle
    return self
  }
  
  func showAlert() {
    let alert = UIAlertController(
      title: product.title,
      message: product.message,
      preferredStyle: .alert
    )
    
    let confirmButton = UIAlertAction(
      title: product.confirmTitle,
      style: .default
    )
        
    alert.addAction(confirmButton)
    viewController?.present(alert, animated: true, completion: nil)
  }
}


