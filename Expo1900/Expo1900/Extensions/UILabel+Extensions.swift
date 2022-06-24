//
//  String+Extensions.swift
//  Expo1900
//
//  Created by Baek on 2022/06/17.
//

import UIKit

extension UILabel {
    func setTitle(by seperator: Character, for style: UIFont.TextStyle) {
        let font = UIFont.preferredFont(forTextStyle: style)
        let fullText = self.text ?? ""
        
        guard let targetString = fullText.split(separator: seperator).map({ String($0) }).first else {
            return
        }
        
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
}
