//  Expo1900 - UILabel.swift
//  Created by Ayaan, Bella on 2022/10/26.
//  Copyright © yagom academy. All rights reserved.


import UIKit

extension UILabel {
    func setUpDynamicType(fontStyle: UIFont.TextStyle) {
        self.font = .preferredFont(forTextStyle: fontStyle)
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
    func setUpAttributedText() {
        guard let text: String = self.text else {
            return
        }
        
        let colon: Character = ":"
        let range = NSRange(location: 0,
                            length: text.prefix(while: {$0 != colon}).count)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font,
                                     value: UIFont.preferredFont(forTextStyle: .body),
                                     range: NSRange(location: 0, length: text.count))
        
        attributeString.addAttribute(.font,
                                     value: UIFont.preferredFont(forTextStyle: .title2),
                                     range: range)
        
        self.attributedText = attributeString
    }
}
