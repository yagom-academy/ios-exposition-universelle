import UIKit

extension NSMutableAttributedString {
    
    func append(string: String, forTextStyle: UIFont.TextStyle) {
        let font = UIFont.preferredFont(forTextStyle: forTextStyle)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        append(NSAttributedString(string: string, attributes: attributes))
    }
}
