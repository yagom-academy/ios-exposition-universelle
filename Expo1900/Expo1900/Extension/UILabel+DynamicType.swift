//
//  UILabel+DynamicType.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/14.
//

import UIKit

extension UILabel {
    func setDynamicType(textStyle: UIFont.TextStyle) {
        self.adjustsFontForContentSizeCategory = true
        self.font = .preferredFont(forTextStyle: textStyle)
    }
}
