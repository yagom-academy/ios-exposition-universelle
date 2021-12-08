import Foundation

extension Int {
    var decimalString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
                
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
