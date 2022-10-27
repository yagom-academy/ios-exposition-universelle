//
//  CenterAlignmentButton.swift
//  Expo1900
//
import UIKit

class CenterAlignmentButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.titleLabel?.textAlignment = .center
    }
}
