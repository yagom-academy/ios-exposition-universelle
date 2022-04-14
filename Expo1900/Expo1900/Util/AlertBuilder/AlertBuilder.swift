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
  var cancelTitle: String?
  var confirmHandler: (() -> Void)?
  var cancelHandler: (() -> Void)?
}

protocol AlertBuilderable {
  init(viewController: UIViewController)
  func setTitle(_ title: String) -> AlertBuilderable
  func setConfirmTitle(_ confirmTitle: String) -> AlertBuilderable
  func setMessage(_ message: String) -> AlertBuilderable
  func setCancelTitle(_ cancelTitle: String) -> AlertBuilderable
  func setConfirmHandler(_ confirmHandler: @escaping (() -> Void)) -> AlertBuilderable
  func setCancelHandler(_ cancelHandler: @escaping (() -> Void)) -> AlertBuilderable
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
  
  func setMessage(_ message: String) -> AlertBuilderable {
    product.message = message
    return self
  }
  
  func setCancelTitle(_ cancelTitle: String) -> AlertBuilderable {
    product.cancelTitle = cancelTitle
    return self
  }
  
  func setConfirmHandler(_ confirmHandler: @escaping (() -> Void)) -> AlertBuilderable {
    product.confirmHandler = confirmHandler
    return self
  }
  
  func setCancelHandler(_ cancelHandler: @escaping (() -> Void)) -> AlertBuilderable {
    product.cancelHandler = cancelHandler
    return self
  }
  
  func showAlert() {
    let alert = UIAlertController(
      title: product.title,
      message: product.message,
      preferredStyle: .alert
    )
    
    if let cancelTitle = product.cancelTitle {
      let cancelButton = UIAlertAction(
        title: cancelTitle,
        style: .destructive
      ) { _ in
        self.product.cancelHandler?()
      }
      alert.addAction(cancelButton)
    }
    
    let confirmButton = UIAlertAction(
      title: product.confirmTitle,
      style: .default
    ) { [weak self] _ in
      self?.product.confirmHandler?()
    }
    
    alert.addAction(confirmButton)
    viewController?.present(alert, animated: true, completion: nil)
  }
}


