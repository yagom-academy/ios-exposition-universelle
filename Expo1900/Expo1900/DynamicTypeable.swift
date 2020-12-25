//
//  DynamicTypeable.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/25.
//

import Foundation

@objc protocol DynamicTypeable {
    func setLabelFontStyle()
    @objc optional func setLabelFontSizeToFitWidth()
}
