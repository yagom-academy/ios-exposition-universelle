//
//  UIImage+Accessibility.swift
//  Expo1900
//
//  Created by Hyoju Son on 2021/12/15.
//

import UIKit

extension UIImageView {
    func applyAccessbility(with label: String) {
        self.adjustsImageSizeForAccessibilityContentSizeCategory = true
        self.isAccessibilityElement = true
        self.accessibilityLabel = label
    }
}
