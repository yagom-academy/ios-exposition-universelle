import UIKit

extension NSMutableAttributedString {
    
    func append(_ text: String, forTextStyle: UIFont.TextStyle) {
        let font = UIFont.preferredFont(forTextStyle: forTextStyle)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        append(NSAttributedString(string: text, attributes: attributes))
    }
}
