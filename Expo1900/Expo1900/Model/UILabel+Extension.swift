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
}
