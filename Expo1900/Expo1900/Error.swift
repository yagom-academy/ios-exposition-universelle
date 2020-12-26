enum SystemError: Error {
    case dataSetting
    case unknown
    
    var description: String {
        switch self {
        case .dataSetting:
            return "정보를 가져오는데 실패했습니다.\n잠시 후 다시 시도해주세요."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다.\n잠시 후 다시 시도해주세요."
        }
    }
}
