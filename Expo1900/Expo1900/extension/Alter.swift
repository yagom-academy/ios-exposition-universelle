//
//  Alter.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

extension UIViewController {
     func alterError(_ error: Error) {
        let message = error.localizedDescription
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        alert.present(self, animated: true)
    }
}
