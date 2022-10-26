//
//  UILabel.swift
//  Expo1900
//
//  Created by hy on 2022/10/26.
//

import UIKit

extension UILabel {
    func setUpAccessibility(fontStyle: UIFont.TextStyle) {
        self.font = .preferredFont(forTextStyle: fontStyle)
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
    }
}
