//
//  UILabel+Extension.swift
//  Expo1900
//
//  Created by 고명주 on 2022/04/21.
//

import UIKit

extension UILabel {
    func changeFont(to fontStyle: UIFont.TextStyle, letter: String?) {
        let font = UIFont.preferredFont(forTextStyle: fontStyle)
        
        guard let text = self.text else {
            return
        }
        
        guard let letter = letter else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.font, value: font, range: (text as NSString).range(of: letter))
        self.attributedText = attributedString
    }
}
