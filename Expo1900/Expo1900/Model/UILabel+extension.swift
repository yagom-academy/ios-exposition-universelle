//
//  UILabel+extension.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/27.
//

import UIKit

extension UILabel {
    func applyFont(targetString: String) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        let otherRange = (fullText as NSString).range(of: String(fullText.dropFirst(targetString.count)))
        attributedString.addAttribute(.font,
                                      value: UIFont.preferredFont(forTextStyle: .title3),
                                      range: range)
        attributedString.addAttribute(.font,
                                      value: UIFont.preferredFont(forTextStyle: .callout),
                                      range: otherRange)
        attributedText = attributedString
    }
}
