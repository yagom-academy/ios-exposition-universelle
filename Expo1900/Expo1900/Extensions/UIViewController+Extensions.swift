//
//  UIViewController+Extensions.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/18.
//

import UIKit

extension UIViewController {
    func showConfirmAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}
