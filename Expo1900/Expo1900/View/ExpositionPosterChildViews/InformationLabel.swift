//
//  InformationLabel.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

class InformationLabel: UILabel {
    init() {
        super.init(frame: .zero)
        textAlignment = .center
    }
    
    init(alignment: NSTextAlignment, settingFont: UIFont?, lines: Int = 1) {
        super.init(frame: .zero)
        
        textAlignment = alignment
        
        
        if let settingFont {
            font = settingFont
        }
        numberOfLines = lines
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        textAlignment = .center
    }
}
