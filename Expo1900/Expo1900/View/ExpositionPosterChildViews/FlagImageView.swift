//
//  FlagImageView.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

class FlagImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        
        setContentLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setContentLayout()
    }
    
    func setContentLayout() {
        contentMode = .scaleAspectFit
        
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
