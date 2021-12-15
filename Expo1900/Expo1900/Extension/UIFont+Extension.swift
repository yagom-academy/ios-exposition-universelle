
import UIKit

extension UIFont {
    static let expoInfoTitleFont: UIFont = .preferredFont(forTextStyle: .title1)
    static let expoInfoBodyFont: UIFont = .preferredFont(forTextStyle: .body)
    static let textViewFont: UIFont = .preferredFont(forTextStyle: .body)
    static let itemTitleFont: UIFont = {
        let font = UIFont.systemFont(ofSize: 30)
        let metrics = UIFontMetrics(forTextStyle: .title1)
        return metrics.scaledFont(for: font)
    }()
    static let itemDescriptionFont: UIFont = .preferredFont(forTextStyle: .body)
}
