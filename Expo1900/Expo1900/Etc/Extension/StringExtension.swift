//
//  StringExtension.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//

import UIKit

extension String {
    var attributedString: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        guard let index = self.firstIndex(of: ":") else { return attributedString }
        
        let range = String(self[index...])
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: (self as NSString).range(of: range))
        
        return attributedString
    }
}
