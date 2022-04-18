import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var convertedVisitors: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            guard let result = numberFormatter.string(for: self.visitors) else { return String(self.visitors) }
            return result
        }
    }
}
