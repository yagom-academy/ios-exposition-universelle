//
//  UITextView+Extension.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/13.
//

import UIKit

extension UITextView {
    func configure(with text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .paragraphStyle: paragraphStyle]
        self.attributedText = NSAttributedString(
            string: text,
            attributes: attribute)
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
    }
}
