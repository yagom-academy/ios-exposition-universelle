
import Foundation

struct ExpoInfo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension ExpoInfo {
    var formattedVisitors: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formatted = numberFormatter.string(for: self.visitors) else {
            return ""
        }
        
        return formatted + " 명"
    }
}
