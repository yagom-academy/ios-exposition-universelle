//  InformationLabel.swift
//  InformationLabel
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class InformationLabel: UILabel {
    init() {
        super.init(frame: .zero)
        textAlignment = .center
    }
    
    init(
        alignment: NSTextAlignment,
        settingFont: UIFont = UIFont.preferredFont(forTextStyle: .body),
        lines: Int = 0
    ) {
        super.init(frame: .zero)
        
        textAlignment = alignment
        
        
        font = settingFont
        numberOfLines = lines
        
        adjustsFontForContentSizeCategory = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        textAlignment = .center
    }
}
