//
//  UILabel.swift
//  Expo1900
//
//  Created by mmim, Minseong.

import UIKit

extension UILabel {
    func downSize(targetString: String) {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
}


