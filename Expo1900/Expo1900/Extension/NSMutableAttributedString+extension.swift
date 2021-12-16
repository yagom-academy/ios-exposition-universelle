import UIKit

extension NSMutableAttributedString {
    func setTextSize(string: String, fontSize: UIFont.TextStyle) -> Self {
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: fontSize)]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}
