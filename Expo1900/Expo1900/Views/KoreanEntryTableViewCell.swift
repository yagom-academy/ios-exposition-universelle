//
//  KoreanEntryTableViewCell.swift
//  Expo1900
//
//  Created by Gordon Choi on 2022/06/17.
//

import UIKit

final class KoreanEntryTableViewCell: UITableViewCell, ReuseIdentifying {
    private lazy var entryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.adjustsFontSizeToFitWidth = true
        return titleLabel
    }()
    private lazy var shortDescriptionLabel: UILabel = {
        let shortDescriptionLabel = UILabel()
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.numberOfLines = 0
        shortDescriptionLabel.lineBreakStrategy = .hangulWordPriority
        shortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        shortDescriptionLabel.adjustsFontForContentSizeCategory = true
        return shortDescriptionLabel
    }()
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .vertical
        return stackView
    }()
}

extension KoreanEntryTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupAttribute()
        setupLayout()
    }

    private func setupAttribute() {
        contentView.addSubview(entryImageView)
        
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(shortDescriptionLabel)
        contentView.addSubview(descriptionStackView)
        
        accessoryType = .disclosureIndicator
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            entryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entryImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionStackView.centerYAnchor.constraint(equalTo: entryImageView.centerYAnchor),
            descriptionStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            descriptionStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            descriptionStackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            descriptionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

extension KoreanEntryTableViewCell {
    func configure(with data: ExpositionEntry) {
        entryImageView.image = data.thumbnail
        titleLabel.text = data.name
        shortDescriptionLabel.text = data.shortDescription
    }
}
