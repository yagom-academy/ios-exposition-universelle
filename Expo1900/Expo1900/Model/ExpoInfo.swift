
import Foundation

struct ExpoInfo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension ExpoInfo {
    var formattedTitle: String {
        return self.title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var formattedVisitors: String {
        guard let formatted = NumberFormatter.decimal.string(for: self.visitors) else {
            return ""
        }
        
        return formatted + " 명"
    }
}
