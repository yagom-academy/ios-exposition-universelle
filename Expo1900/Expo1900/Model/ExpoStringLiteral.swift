
import Foundation

enum ExpoStringLiteral {
    case expoInfoTitle
    case itemsTitle
    case alertActionOK
    
    var text: String {
        switch self {
            case .expoInfoTitle:
                return "메인"
            case .itemsTitle:
                return "한국의 출품작"
            case .alertActionOK:
                return "확인"
        }
    }
}
