//
//  Alert.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/16.
//

import Foundation
import UIKit
extension UIViewController {
    func showAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert(error: JsonDecodingError) -> UIAlertController {
        let alert = UIAlertController(title: "앗! \(error.debugDescription)", message: "제작자에게 에러 로그를 전송해주시겠어요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .cancel)
        let noAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        return alert
    }
}
