
import Foundation

enum ParserError: Error {
    case invaildFileName
    case failToParseExpoInfo
    case failToParseItemsInfo
}

extension ParserError: LocalizedError {
    var errorDescription: String? {
        return "데이터를 불러올 수 없습니다."
    }
}
