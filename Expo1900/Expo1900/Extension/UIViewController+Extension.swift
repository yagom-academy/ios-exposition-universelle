//
//  UIViewController+Extension.swift
//  Expo1900
//
//  Created by JINHONG AN on 2021/07/09.
//

import UIKit

//MARK:- Error Related Alert
extension UIViewController {
    func showAlert(error: Error) {
        let okActionTitle = "확인"
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okActionTitle, style: .default)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
