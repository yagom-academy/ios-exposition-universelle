import Foundation
import UIKit

enum DataHandlingError: Error {
    case invalidFile
    case notDecoded
    
    var description: String {
        switch self {
        case .invalidFile:
            return "유효하지 않은 파일입니다."
        case .notDecoded:
            return "디코드에 실패했습니다."
        }
    }
}
