import UIKit

extension UILabel {
    func setUpDynamicFont(forTextStyle textStyle: UIFont.TextStyle) {
        font = UIFont.preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
    }
}
