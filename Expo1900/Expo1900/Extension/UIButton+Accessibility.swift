//
//  UIButton+Accessibility.swift
//  Expo1900
//
//  Created by Hyoju Son on 2021/12/15.
//

import UIKit

extension UIButton {
    func applyAccessibilityWithText(textStyle: UIFont.TextStyle) {
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleLabel?.font = .preferredFont(forTextStyle: textStyle)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
