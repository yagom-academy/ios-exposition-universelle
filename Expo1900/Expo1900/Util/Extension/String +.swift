//
//  String +.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/30.
//

import UIKit

extension String {
    func addAttributeFontForKeyword(keywordFont: UIFont, noneKeywordFont: UIFont , keyword: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        let noneKeywordString = self.replacingOccurrences(of: keyword, with: "")
        
        attributeString.addAttribute(.font,
                                     value: keywordFont,
                                     range: (self as NSString).range(of: keyword))
        attributeString.addAttribute(.font,
                                     value: noneKeywordFont,
                                     range: (self as NSString).range(of: noneKeywordString))
        
        return attributeString
    }
}
