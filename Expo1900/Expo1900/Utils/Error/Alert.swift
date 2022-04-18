//
//  ShowAlert.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/18.
//

import UIKit

extension UIViewController {
    func showAlert(alertTitle: String,
                   okTitle: String?,
                   okAction: (() -> ())? = nil,
        
        let alertController = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
    
        if let okTitle = okTitle {
            let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
                okAction?()
            }
            alertController.addAction(okAction)
        }
        self.present(alertController, animated: true)
    }
}
