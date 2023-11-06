//
//  ErrorAlert.swift
//  Expo1900
//
//  Created by hyunMac on 11/6/23.
//

import UIKit

struct ErrorAlert {
    func generateAlert(viewController: UIViewController, errorReason: String) {
        let alertController = UIAlertController(
            title: "경고",
            message: "\(errorReason) 에러가 발생했습니다.",
            preferredStyle: .alert
        )
        let confirmButton = UIAlertAction(title: "확인", style: .default)
        
        alertController.addAction(confirmButton)
        
        viewController.present(alertController, animated: true)
    }
}
