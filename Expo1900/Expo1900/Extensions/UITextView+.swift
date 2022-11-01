//
//  UITextView+.swift
//  Expo1900

import UIKit

extension UITextView {
    func setDynamicType(with font: UIFont) {
        self.font = font
        self.adjustsFontForContentSizeCategory = true
    }
}
