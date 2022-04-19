//
//  ExpoError.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/13.
//

import UIKit

enum ExpoError: Error {
    case decodingError
    case noFileError
}

protocol GenerateErrorAlertProtocol {
    func makeUIAlertControllerFromError(_ error: Error) -> UIAlertController
}

extension GenerateErrorAlertProtocol {
    func makeUIAlertControllerFromError(_ error: Error) -> UIAlertController {
        var errorMessage = ""
        if let _ = error as? ExpoError {
            errorMessage = "디코딩 에러입니다. 앱을 재설치 해주세요."
        } else {
            errorMessage = "알수없는 에러입니다."
        }
        
        let alert = UIAlertController(title: "오류", message: errorMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "닫기", style: .default, handler: nil)
        alert.addAction(action)
        return alert
    }
}
