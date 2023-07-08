//
//  String+Extension.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/07/06.
//

import UIKit

extension String {
    func addAttributeFont(for keyword: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        
        attributeString.addAttributes([NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .body)],
                                      range: NSRange(location: 0, length: attributeString.length))
        attributeString.addAttribute(.font,
                                     value: UIFont.preferredFont(forTextStyle: .title2),
                                     range: (self as NSString).range(of: keyword))
        
        return attributeString
    }
}
