//
//  FlagButton.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.
        
import UIKit

class FlagButton: UIView {
    let leftImageView = FlagImageView(image: UIImage(named: "flag"))
    let rightImageView = FlagImageView(image: UIImage(named: "flag"))
    let entityButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
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
}

