import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    func decimalVisitors() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: self.visitors) else { return String(self.visitors) }
        return result
    }
    
    func linedTitle() -> String {
        var result = self.title
        result.insert("\n", at: result.firstIndex(of: "(") ?? result.endIndex)
        return result
    }
}
