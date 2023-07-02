//
//  String +.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/30.
//

import UIKit

extension String {
    func addAttributeFontForKeyword(font: UIFont, keyword: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        
        attributeString.addAttribute(.font,
                                     value: font,
                                     range: (self as NSString).range(of: keyword))
        return attributeString
    }
}
