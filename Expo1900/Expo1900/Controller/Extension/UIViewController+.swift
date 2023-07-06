//
//  UIViewController+.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/07/03.
//

import UIKit

extension UIViewController {
    func showDecoderErrorAlert(_ error: Error) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        alert.message = error.localizedDescription
        
        present(alert, animated: true)
    }
}
