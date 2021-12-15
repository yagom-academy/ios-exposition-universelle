//
//  AlertDelegate.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/15.
//

import UIKit

protocol AlertDelegate: UIViewController {
    
    func showAlert(alertMessage: String, buttonMessage: String)
}
