//
//  UIViewController+extension.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/15.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    func showFailureAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(confirmButton)
        present(alertController, animated: true)
    }
}
