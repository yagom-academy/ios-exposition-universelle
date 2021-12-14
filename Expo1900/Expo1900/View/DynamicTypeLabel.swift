import UIKit

class DynamicTypeLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpFont(forTextStyle textStyle: UIFont.TextStyle) {
        font = UIFont.preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
    }
}
