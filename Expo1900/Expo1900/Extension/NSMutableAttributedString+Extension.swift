import UIKit

extension NSMutableAttributedString {
    func title3(text: String) -> NSMutableAttributedString {
        let font = UIFont.preferredFont(forTextStyle: .title3)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        append(NSAttributedString(string: text, attributes: attributes))
        return self
    }
    
    func body(text: String) -> NSMutableAttributedString {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        append(NSAttributedString(string: text, attributes: attributes))
        return self
    }
}
