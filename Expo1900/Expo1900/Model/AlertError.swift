//
//  AlertError.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/23.
//

enum AlertError {
    case decodingError
    
    var message: String {
        switch self {
        case .decodingError:
            return "데이터 로딩 오류"
        }
    }
}
