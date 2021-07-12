//
//  DataTransferError.swift
//  Expo1900
//
//  Created by Jae-hoon Sim on 2021/07/12.
//

import Foundation

enum DataTransferError: Error, LocalizedError {
    case sendingError
    case recievingError
    
    var errorDescription: String? {
        switch self {
        case .sendingError:
            return "데이터를 다음 화면으로 전송하는 과정에서 문제가 발생했습니다."
        case .recievingError:
            return "데이터를 받는 과정에서 문제가 발생했습니다."
        }
    }
}
