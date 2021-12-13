import Foundation

enum DecimalNumberFormatter {
    static func string(for obj: Any?) -> String? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        return formatter.string(for: obj)
    }
}
