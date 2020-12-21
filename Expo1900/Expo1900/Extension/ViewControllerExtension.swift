//
//  ViewControllerExtension.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import UIKit

extension UIViewController {
    func errorAlert(error: Error, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        var errorMessage: String?
        if let expositionError = error as? ExpositionError {
            errorMessage = expositionError.localizedDescription
        }
        else {
            errorMessage = ExpositionError.unknown.localizedDescription
        }
        
        let alert = UIAlertController(title: "오류", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(okAction)
        return alert
    }
}
