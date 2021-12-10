import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitor: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            let result = numberFormatter.string(from: NSNumber(integerLiteral: visitors)) ?? String(visitors)
            return result
        }
    }
    
}
