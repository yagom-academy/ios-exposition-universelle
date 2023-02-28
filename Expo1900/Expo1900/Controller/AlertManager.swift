//
//  AlertManager.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/23.
//

import UIKit

enum AlertManager {
    
    static func decodingFailureAlert(error: AlertError) -> UIAlertController {
        let alertController = UIAlertController(title: nil,
                                                message: error.message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        
        return alertController
    }
}
