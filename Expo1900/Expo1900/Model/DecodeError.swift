//
//  DecodeError.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/03.
//

import Foundation

enum DecodeError: LocalizedError {
    case searchNoFile
    case jsonDecodeError
    
    var errorDescription: String {
        switch self {
        case .searchNoFile:
            return "파일을 찾을 수 없습니다."
        case .jsonDecodeError:
            return "json파일 decoding을 실패했습니다."
        }
    }
}
