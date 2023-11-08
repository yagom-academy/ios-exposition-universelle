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
            title: configuration.title,
            message: configuration.messaage,
            preferredStyle: .alert
        )
        let confirmButton = UIAlertAction(title: configuration.actionTitle, style: .default)

        alertController.addAction(confirmButton)

        viewController.present(alertController, animated: true)
    }
}
