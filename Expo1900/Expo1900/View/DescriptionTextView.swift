
import UIKit

class DescriptionTextView: UITextView {
    private let paragraphStyle: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.lineBreakStrategy = .hangulWordPriority
        return style
    }()
    
    private lazy var attribute: [NSAttributedString.Key: Any] = [
        .font: UIFont.textViewFont,
        .paragraphStyle: paragraphStyle
    ]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
        self.adjustsFontForContentSizeCategory = true
    }
    
    func setAttribute(with text: String) {
        self.attributedText = NSAttributedString(string: text, attributes: attribute)
    }
}
