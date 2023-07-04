//
//  AlertController.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/07/04.
//

import UIKit

class AlertController: UIAlertController {
    func configureAlert(errorName: String) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: errorName, message: "", preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        return alert
    }
}
