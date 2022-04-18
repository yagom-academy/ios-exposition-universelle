//
//  DataLoadError.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/13.
//

import Foundation

enum DataLoadError: Error {
    case assetLoadError
    case dataLoadError
}

extension DataLoadError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .assetLoadError:
            return "(파일명 오류)"
        case .dataLoadError:
            return "(디코딩 오류)"
        }
    }
}
