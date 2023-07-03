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
        
        switch error {
        case DecoderError.notFoundAsset:
            alert.message = DecoderError.notFoundAsset.description
        case DecoderError.decodeFailed:
            alert.message = DecoderError.decodeFailed.description
        default:
            alert.message = DecoderError.unexpectedError.description
        }
        
        present(alert, animated: true)
    }
}
