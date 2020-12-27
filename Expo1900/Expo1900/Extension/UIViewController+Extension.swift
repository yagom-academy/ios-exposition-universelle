//
//  UIViewController+Extension.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/25.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
}
