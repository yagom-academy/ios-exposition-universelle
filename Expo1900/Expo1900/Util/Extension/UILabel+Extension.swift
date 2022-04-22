//
//  UILabel.swift
//  Expo1900
//
//  Created by mmim, Minseong.

import UIKit

extension UILabel {
    func convertToBodyFont(targetString: String) {
        guard let fullText = self.text else {
            return
        }
        
        let font = UIFont.preferredFont(forTextStyle: .body)
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
}


