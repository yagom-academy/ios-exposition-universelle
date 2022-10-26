//
//  UILabel.swift
//  Expo1900
//
//  Created by hy on 2022/10/26.
//

import UIKit

extension UILabel {
    func setUpAccessibility(fontStyle: UIFont.TextStyle) {
        self.font = .preferredFont(forTextStyle: fontStyle)
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
    func setUpAttributedText() {
        guard let text: String = self.text else {
            return
        }
        let range = NSRange(location: 0,
                            length: text.prefix(while: {$0 != ":"}).count)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font,
                                     value: UIFont.preferredFont(forTextStyle: .title2),
                                     range: range)
        
        self.attributedText = attributeString
    }
}
