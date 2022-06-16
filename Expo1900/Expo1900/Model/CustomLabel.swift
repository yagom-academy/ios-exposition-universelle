//
//  CustomLabel.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/17.
//

import UIKit

struct CustomLabel {
    static func setNumberOfLinesToZero(into label: UILabel) {
        label.numberOfLines = 0
    }
    
    static func setLineBreakMode(into label: UILabel, style: NSLineBreakMode) {
        label.lineBreakMode = style
    }
    
    static func setLabelFont(into label: UILabel, style: UIFont.TextStyle) {
        label.font = UIFont.preferredFont(forTextStyle: style)
    }
    
    static func setNumberFormat() -> NumberFormatter {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        
        return numberformatter
    }
}
