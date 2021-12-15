//
//  UIViewController+extension.swift
//  Expo1900
//
//  Created by 예거 on 2021/12/13.
//

import UIKit

extension UIViewController {
    
    func showAlert(alertMessage: String, buttonMessage: String) {
        let alert = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonMessage, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
