//
//  AlertController.swift
//  Expo1900
//
//  Created by Yeseul Jang on 2023/07/05.
//

import UIKit

class AlertController: UIAlertController {
    static func configureAlert(errorName: String) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: errorName, message: "", preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)

        return alert
    }
}
