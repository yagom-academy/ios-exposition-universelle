//
//  UIAlertManager.swift
//  Expo1900
//
//  Created by Ellen on 2021/07/16.
//

import UIKit

extension UIAlertAction {
    enum ActionType {
        case ok
        case cancel
        
        func action() -> UIAlertAction {
            var actionStyle: UIAlertAction.Style = .default
            var title: String = ""
            
            switch self {
            case .ok:
                title = "OK"
            case .cancel:
                title = "Cancel"
                actionStyle = .cancel
            }
            return (UIAlertAction(title: title, style: actionStyle))
        }
    }
}
