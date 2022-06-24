//
//  UIViewController+Extensions.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/18.
//

import UIKit

extension UIViewController {
    func activateOnlyPortraitOrientation(_ isActivated: Bool) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        delegate.isActivatedOnlyPortrait = isActivated
    }
    
    func showConfirmAlert(title: String, message: String, alertStyle: AlertStyle) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        
        if alertStyle == .revert {
            let revertAction = UIAlertAction(title: title, style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(revertAction)
        } else {
            let confirmAction = UIAlertAction(title: title, style: .default, handler: nil)
            alertController.addAction(confirmAction)
        }
        
        self.present(alertController, animated: true)
    }
}

enum AlertStyle {
    case confirm
    case revert
}
