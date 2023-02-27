//
//  UIViewControllerExtension.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//

import UIKit

extension UIViewController {
    func showFailAlert() {
        let alert = UIAlertController(title: "Error", message: "데이터 로딩 실패", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
