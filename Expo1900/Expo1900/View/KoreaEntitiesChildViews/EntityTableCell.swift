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
        
        setUpEntityImageViewLayout()
        setUpTitleLabelLayout()
        setUpSubTitleLabelLayout()
        
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: entityImageView.heightAnchor).isActive = true
        
    }
    
    private func setUpEntityImageViewLayout() {
        NSLayoutConstraint.activate([
            entityImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            entityImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            entityImageView.heightAnchor.constraint(equalTo: entityImageView.widthAnchor)
        ])
    }
    
    private func setUpTitleLabelLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: entityImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func setUpSubTitleLabelLayout() {
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: entityImageView.trailingAnchor, constant: 8),
        ])
    }
    
    func setViewData(entity: Entity) {
        titleLabel.text = entity.name
        subTitleLabel.text = entity.summary
        entityImageView.image = UIImage(named: entity.imageName)
    }
}
