
enum Expo1900Error: Error, CustomStringConvertible {
    case dataNotFoundInAsset(String)
    
    var description: String {
        switch self {
        case .dataNotFoundInAsset(let fileName):
            return "[\(fileName)]와 일치하는 파일을 찾지 못했습니다."
        }
    }
}
