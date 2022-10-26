//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Hamo, Mene on 2022/10/26.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    let entryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let entryTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enrtyShortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let entryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        entryStackView.addArrangedSubview(entryTitleLabel)
        entryStackView.addArrangedSubview(enrtyShortDescriptionLabel)
        contentView.addSubview(entryImageView)
        contentView.addSubview(entryStackView)
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            entryImageView.heightAnchor.constraint(equalTo: entryImageView.widthAnchor),
            entryImageView.centerYAnchor.constraint(equalTo: entryStackView.centerYAnchor),
            
            entryStackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            entryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            entryStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            entryStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}
