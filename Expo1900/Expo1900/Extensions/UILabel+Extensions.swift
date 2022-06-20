//
//  String+Extensions.swift
//  Expo1900
//
//  Created by Baek on 2022/06/17.
//

import Foundation
import UIKit

extension UILabel {
    func setTitle(by seperator: Character, for style: UIFont.TextStyle) {
        let font = UIFont.preferredFont(forTextStyle: style)
        let fullText = self.text ?? ""
        
        let targetString = fullText.split(separator: seperator).map{ String($0) }[0]
        
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
}
