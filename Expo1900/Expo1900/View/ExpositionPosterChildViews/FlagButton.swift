//  FlagButton.swift
//  FlagButton
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class FlagButton: UIButton {
    let leftImageView = FlagImageView(image: UIImage(named: Constant.koreanFlagImageName))
    let rightImageView = FlagImageView(image: UIImage(named: Constant.koreanFlagImageName))
    
    init() {
        super.init(frame: .zero)
        
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.textAlignment = .center
        
        setTitle(Constant.entityButtonTitle, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout() {
        [leftImageView,rightImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        guard let titleLabel else {
            return
        }
        
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftImageView.topAnchor.constraint(equalTo: topAnchor),
            leftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            rightImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            rightImageView.topAnchor.constraint(equalTo: topAnchor),
            rightImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


// MARK: - UserInterAction 관련 메서드
extension FlagButton {
    func setUpButtonAction(action: @escaping () -> ()) {
        let presentAction = UIAction { _ in
            action()
        }
        addAction(presentAction, for: .touchUpInside)
    }
}
