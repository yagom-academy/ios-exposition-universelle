//
//  String +.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/30.
//

import UIKit

extension String {
    func addAttributeBigFontForKeyword(keyword: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        
        attributeString.addAttribute(.font,
                                     value: UIFont.systemFont(ofSize: 20),
                                     range: (self as NSString).range(of: keyword))
        return attributeString
    }
}
