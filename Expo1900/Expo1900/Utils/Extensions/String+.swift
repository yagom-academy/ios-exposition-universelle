//
//  String+.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/07/05.
//

import UIKit

extension String {
    func fontSeparate(titleFont: UIFont.TextStyle, title: String, contentFont: UIFont.TextStyle, content: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        let titleRange = NSRange(location: 0, length: title.count)
        let contentRange = NSRange(location: title.count, length: content.count)
        
        attributedString.addAttribute(.font, value: titleFont, range: titleRange)
        attributedString.addAttribute(.font, value: contentFont, range: contentRange)
        
        return attributedString
    }
}
