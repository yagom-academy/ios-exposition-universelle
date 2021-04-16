//
//  Alert.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/16.
//

import Foundation
import UIKit

extension ExpoIntroductionViewController {
    func showFailAlerts() {
        guard let error = errorList.first else {
            return
        }
        
        func showNextError() {
            self.errorList.removeFirst()
            self.showFailAlerts()
        }
        
        let alert = UIAlertController(title: "앗! \(error.debugDescription)", message: "제작자에게 에러 로그를 전송해주시겠어요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .cancel) { (action) in showNextError() }
        let noAction = UIAlertAction(title: "아니오", style: .default) { (action) in showNextError() }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}


extension KoreanItemTableViewController {
    func showFailAlerts() {
        guard let error = errorList.first else {
            return
        }
        
        func showNextError() {
            self.errorList.removeFirst()
            self.showFailAlerts()
        }
        
        let alert = UIAlertController(title: "앗! \(error.debugDescription)", message: "제작자에게 에러 로그를 전송해주시겠어요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .cancel) { (action) in showNextError() }
        let noAction = UIAlertAction(title: "아니오", style: .default) { (action) in showNextError() }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}
