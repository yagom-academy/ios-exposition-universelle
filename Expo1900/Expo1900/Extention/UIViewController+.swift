//
//  UIViewController+.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/19.
//

import UIKit

private enum Const {
  enum Alert {
    static let title = "오류"
    static let okAction = "확인"
  }
}

extension UIViewController {
  
  func showAlert(errorMessage: String) {
    let alertController = UIAlertController(title: Const.Alert.title, message: errorMessage, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: Const.Alert.okAction, style: .default)
    alertController.addAction(alertAction)
    present(alertController, animated: true)
  }
}
