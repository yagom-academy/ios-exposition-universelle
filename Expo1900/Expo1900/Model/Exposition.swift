import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitor: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(integerLiteral: visitors)) ?? String(visitors)
        return result
    }
    
    init(title: String = "", visitors: Int = 0, location: String = "", duration: String = "", description: String = "") {
        self.title = title
        self.visitors = visitors
        self.location = location
        self.duration = duration
        self.description = description
    }
}
