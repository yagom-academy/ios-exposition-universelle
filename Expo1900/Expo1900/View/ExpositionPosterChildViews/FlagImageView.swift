//  FlagImageView.swift
//  FlagImageView
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class FlagImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        
        setContentLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout 설정
private extension FlagImageView {
    func setContentLayout() {
        contentMode = .scaleAspectFit
        
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
