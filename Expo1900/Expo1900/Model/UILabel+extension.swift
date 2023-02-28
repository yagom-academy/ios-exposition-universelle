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
        attributedString.addAttribute(.font,
                                      value: UIFont.preferredFont(forTextStyle: .title3),
                                      range: range)
        attributedText = attributedString
    }
}
