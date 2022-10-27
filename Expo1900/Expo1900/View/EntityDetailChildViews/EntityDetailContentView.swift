//  EntityDetailContentView.swift
//  EntityDetailContentView
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class EntityDetailContentView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel = InformationLabel(alignment: .natural)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setChildContentViewLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - View Update 관련 메서드
extension EntityDetailContentView {
    func setImageView(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    func setDescriptionLabel(description: String) {
        descriptionLabel.text = description
    }
}

// MARK: - Layout 설정
private extension EntityDetailContentView {
    func setChildContentViewLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        setImageViewLayout()
        setDescriptionLayout()
    }
    
    func setImageViewLayout() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: imageView.widthAnchor),
        ])
    }
    
    func setDescriptionLayout() {
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
