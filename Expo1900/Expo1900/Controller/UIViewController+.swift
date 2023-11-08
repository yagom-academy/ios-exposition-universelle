//
//  ViewController.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

extension UIViewController {
    func showAlert(_ error: Error) {
        let alertTitle: String = "오류"
        var message: String {
            switch error {
            case DecoderError.assetNameError:
                return "애셋네임을 알 수 없습니다."
            case DecoderError.jsonDataError:
                return "제이슨 데이터를 알 수 없습니다."
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
}
