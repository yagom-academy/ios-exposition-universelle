//
//  UITextView+.swift
//  Expo1900

import UIKit

extension UITextView {
    func setDynamicType() {
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.adjustsFontForContentSizeCategory = true
    }
}
