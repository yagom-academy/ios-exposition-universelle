//
//  ExpositionLabel.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/09.
//

import UIKit

final class ExpositionLabel: UILabel {
    
    init(frame: CGRect = .zero, text: String, textStyle: UIFont.TextStyle) {
        super.init(frame: frame)
        self.text = text
        font = UIFont.preferredFont(forTextStyle: textStyle)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        lineBreakStrategy = .hangulWordPriority
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
