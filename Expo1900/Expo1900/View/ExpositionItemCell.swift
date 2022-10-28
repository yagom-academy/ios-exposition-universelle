//  Expo1900 - ExpositionItemCell.swift
//  Created by Ayaan, Bella on 2022/10/26.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ExpositionItemCell: UITableViewCell {
    private let itemImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setUpDynamicType(fontStyle: .title2)
        label.textColor = .black
        
        return label
    }()
    
    private let shortDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setUpDynamicType(fontStyle: .callout)
        label.textColor = .black
        
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpItemImageView()
        setUpStackView()
    }
    
    private func setUpItemImageView() {
        contentView.addSubview(itemImageView)
        
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            itemImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setUpStackView() {
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(shortDescriptionLabel)
        
        contentView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            verticalStackView.centerYAnchor.constraint(equalTo: itemImageView.centerYAnchor),
            verticalStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 20),
            verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func configure(for item: ExpositionUniverselleItem) {
        self.itemImageView.image = UIImage(named: item.imageName)
        self.titleLabel.text = item.name
        self.shortDescriptionLabel.text = item.shortDescription
        self.accessoryType = .disclosureIndicator
    }
}
