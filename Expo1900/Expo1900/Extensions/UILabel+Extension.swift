//
//  UILabel+Extension.swift
//  Expo1900
//
//  Created by Jun Bang on 2021/12/16.
//

import UIKit

extension UILabel {
    func applyDynamicType(fontStyle: UIFont.TextStyle) {
        self.font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.adjustsFontForContentSizeCategory = true
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.numberOfLines = 0
    }
}
