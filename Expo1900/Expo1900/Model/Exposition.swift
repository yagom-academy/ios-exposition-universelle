import UIKit

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    func decimalVisitors() -> String {
        return NumberFormatAssistant.shared.numberFormatString(for: self.visitors)
    }
    
    func linedTitle() -> String {
        var result = self.title
        result.insert("\n", at: result.firstIndex(of: "(") ?? result.endIndex)
        return result
    }
    
    func setTextAttribute(of value: String, target: String, attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: value)
        attributedText.addAttributes(attributes, range: (value as NSString).range(of: target))
        attributedText.addAttributes([.font: UIFont.preferredFont(forTextStyle: .body)], range: NSRange(location: target.count, length: value.count - target.count))
        return attributedText
    }
}
