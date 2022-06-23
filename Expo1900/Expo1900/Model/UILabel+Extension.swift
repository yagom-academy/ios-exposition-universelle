//
//  UILabel+Extension.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/17.
//

import UIKit

extension UILabel {
    func setNumberFormat(style: NumberFormatter.Style) -> NumberFormatter {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = style
        
        return numberformatter
    }
    
    func changeFontSize(font: UIFont, targetString: String) {
        let fullText = text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedText = attributedString
    }
}
