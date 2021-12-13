
import UIKit

extension UITextView {
    func configure(with text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.textViewFont,
            .paragraphStyle: paragraphStyle]
        self.attributedText = NSAttributedString(
            string: text,
            attributes: attribute)
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
    }
}
