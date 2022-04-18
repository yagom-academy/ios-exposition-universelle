//
//  extension+UIViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/18.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return "\(self)"
    }
    
    func showAlert(for title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
