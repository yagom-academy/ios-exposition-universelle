//
//  EntityTableCell.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.
        

import UIKit

class EntityTableCell: UITableViewCell {
    private let entityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel = InformationLabel(alignment: .left, settingFont: UIFont.systemFont(ofSize: 30))
    private let subTitleLabel = InformationLabel(alignment: .left, settingFont: nil, lines: 0)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        [entityImageView, titleLabel, subTitleLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setUpEntitiyImageViewLayout()
        setUpTitleLabelLayout()
        setUpSubTitleLabelLayout()
    }
    
    private func setUpEntitiyImageViewLayout() {
        NSLayoutConstraint.activate([
            entityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entityImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entityImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            entityImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            entityImageView.widthAnchor.constraint(equalTo: entityImageView.heightAnchor)
        ])
    }
    
    private func setUpTitleLabelLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: entityImageView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func setUpSubTitleLabelLayout() {
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: entityImageView.trailingAnchor),
        ])
    }
}
