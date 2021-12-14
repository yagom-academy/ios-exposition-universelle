import Foundation

enum JSONError: LocalizedError {
    case notFound
    
    var errorDescription: String? {
        switch self {
        case .notFound:
            return "데이터를 불러오지 못했습니다."
        }
    }
}
