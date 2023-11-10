//
//  ViewController.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

extension UIViewController {
    func showErrorAlert(_ error: Error) {
        let alertTitle: String = "오류"
        var message: String {
            switch error {
            case DecoderError.assetName, DecoderError.jsonData:
                print(error.localizedDescription)
                return "데이터를 불러올 수 없습니다."
            default:
                return "시스템오류가 발생했습니다."
            }
        }
        let cancelTiltle: String = "취소"
        let retryTitle: String = "재시도"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelTiltle, style: .default)
        let retryAction = UIAlertAction(title: retryTitle, style: .default)
        
        alert.addAction(retryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func setUpBackButtonAccessibilityLabel(to label: String) {
        let title = navigationItem.title
        let backButton = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
        
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.accessibilityLabel = label
    }
}
