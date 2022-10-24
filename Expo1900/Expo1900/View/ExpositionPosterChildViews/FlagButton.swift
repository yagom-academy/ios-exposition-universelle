//  FlagButton.swift
//  FlagButton
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

class FlagButton: UIView {
    let leftImageView = FlagImageView(image: UIImage(named: Constant.koreanFlag))
    let rightImageView = FlagImageView(image: UIImage(named: Constant.koreanFlag))
    let entityButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(Constant.entityButtonTitle, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setContentLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setContentLayout()
    }
    
    private func setContentLayout() {
        [
            leftImageView,
            entityButton,
            rightImageView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: leftImageView.heightAnchor),
            entityButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            entityButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            leftImageView.centerYAnchor.constraint(equalTo: entityButton.centerYAnchor),
            leftImageView.trailingAnchor.constraint(equalTo: entityButton.leadingAnchor),
            
            rightImageView.centerYAnchor.constraint(equalTo: entityButton.centerYAnchor),
            rightImageView.leadingAnchor.constraint(equalTo: entityButton.trailingAnchor)
        ])
    }
    
    func setUpButtonAction(action: @escaping () -> ()) {
        let presentAction = UIAction { _ in
            action()
        }
        entityButton.addAction(presentAction, for: .touchUpInside)
    }
}

