//
//  extension+UILabel.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/21.
//

import UIKit

extension UILabel {
    func changeFontSize(_ font: UIFont, targetString: String) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
}
