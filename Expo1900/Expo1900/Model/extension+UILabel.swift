//
//  extension+UILabel.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/17.
//

import UIKit

extension UILabel {
    func setNumberOfLines(_ line: Int) {
        self.numberOfLines = line
    }
    
    func setLineBreakMode(style: NSLineBreakMode) {
        self.lineBreakMode = style
    }
    
    func setLabelFont(style: UIFont.TextStyle) {
        self.font = UIFont.preferredFont(forTextStyle: style)
    }
    
    func setNumberFormat(style: NumberFormatter.Style) -> NumberFormatter {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = style
        
        return numberformatter
    }
}
