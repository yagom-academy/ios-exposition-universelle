//
//  Alert.swift
//  Expo1900
//
//  Created by 예거 on 2021/12/13.
//

import UIKit

extension UIViewController {
    
    func showAlert(alertMessage: AlertMessage, buttonMessage: AlertMessage) {
        let alert = UIAlertController(title: nil, message: alertMessage.rawValue, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonMessage.rawValue, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
