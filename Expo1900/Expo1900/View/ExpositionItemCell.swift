//
//  ExpositionItemCell.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/29.
//

import UIKit

final class ExpositionItemCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    let itemImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        configureContentView()
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContentView() {
        accessoryType = .disclosureIndicator
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(shortDescriptionLabel)
    }
    
    private func configureConstraint() {
        configureItemImageViewConstraint()
        configureTitleLabelConstraint()
        configureShortDescriptionLabel()
    }
    
    private func configureItemImageViewConstraint() {
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 100),
            itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor),
            itemImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            itemImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func configureTitleLabelConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        ])
    }
    
    private func configureShortDescriptionLabel() {
        NSLayoutConstraint.activate([
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            shortDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configureCell(with item: Item) {
        titleLabel.text = item.name
        shortDescriptionLabel.text = item.shortDescription
        itemImageView.image = UIImage(named: item.imageName)
    }
}
