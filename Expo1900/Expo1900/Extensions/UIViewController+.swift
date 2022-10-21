//
//  UIViewController+.swift
//  Expo1900

import UIKit

extension UIViewController {
    func showDataErrorAlert() {
        let alert = UIAlertController(title: "데이터 로딩 실패",
                                      message: "데이터를 불러오는데 실패했습니다.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
    
    func showTransitionErrorAlert() {
        let alert = UIAlertController(title: "화면 전환 실패",
                                      message: "다음 페이지로 넘어가는데 실패했습니다.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
}
