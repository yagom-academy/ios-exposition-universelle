//
//  AlertControllerable.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/21.
//

import UIKit

protocol AlertControllerable {}

extension AlertControllerable {
  func showAlertController(
    title: String?,
    message: String?,
    preferredStyle: UIAlertController.Style,
    actions: [UIAlertAction]
  ) -> UIAlertController {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: preferredStyle
    )
    actions.forEach { action in
      alertController.addAction(action)
    }
    return alertController
  }
}
