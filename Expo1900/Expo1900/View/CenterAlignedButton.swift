//
//  CenterAlignedButton.swift
//  Expo1900

import UIKit

class CenterAlignedButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.titleLabel?.textAlignment = .center
    }
}
