//
//  ErrorAlert.swift
//  Expo1900
//
//  Created by hyunMac on 11/6/23.
//

import UIKit

struct ShowAlert {
    static func presentAlert(viewController: UIViewController, configuration: AlertConfiguration) {
        let alertController = UIAlertController(
            title: configuration.alertTitle,
            message: configuration.alertMessaage,
            preferredStyle: .alert
        )
        let confirmButton = UIAlertAction(title: configuration.alertActionTitle, style: .default)

        alertController.addAction(confirmButton)

        viewController.present(alertController, animated: true)
    }
}
