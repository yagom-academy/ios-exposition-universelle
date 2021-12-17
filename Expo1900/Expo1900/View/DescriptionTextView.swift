
import UIKit

class DescriptionTextView: UITextView {
    private let paragraphStyle: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.lineBreakStrategy = .hangulWordPriority
        return style
    }()
    
    private lazy var attribute: [NSAttributedString.Key: Any] = [
        .font: ExpoFont.textViewFont,
        .paragraphStyle: paragraphStyle
    ]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
    }
    
    func setAttribute(with text: String) {
        self.attributedText = NSAttributedString(string: text, attributes: attribute)
        self.adjustsFontForContentSizeCategory = true
    }
}
