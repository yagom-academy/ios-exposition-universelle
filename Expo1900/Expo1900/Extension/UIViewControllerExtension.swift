//
//  ExpositionViewControllerExtension.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

extension UIViewController {
    func implementErrorAlert(_ error: ExpoError) {
        let message = error.errorDescription
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        alert.present(self, animated: true)
    }
}
