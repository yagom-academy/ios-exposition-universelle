//
//  CommonLabel.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/07/04.
//

import UIKit

final class CommonLabel: UILabel {
    
    convenience init() {
        self.init(frame: CGRectZero)
        
        numberOfLines = 0
        minimumScaleFactor = 0.3
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
