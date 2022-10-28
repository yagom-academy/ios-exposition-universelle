//
//  ExpoEntryCell.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit

final class ExpoEntryCell: UITableViewCell {
    
    private let entryImageView: UIImageView = {
        let entryImageView = UIImageView()
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        entryImageView.contentMode = .scaleAspectFit
        return entryImageView
    }()
    private let entryNameLabel: UILabel = {
        let entryNameLabel = UILabel()
        entryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        entryNameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        entryNameLabel.adjustsFontForContentSizeCategory = true
        entryNameLabel.numberOfLines = 0
        return entryNameLabel
    }()
    private let entryShortDescriptionLabel: UILabel = {
        let entryShortDescriptionLabel = UILabel()
        entryShortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        entryShortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        entryShortDescriptionLabel.adjustsFontForContentSizeCategory = true
        entryShortDescriptionLabel.numberOfLines = 0
        return entryShortDescriptionLabel
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryNameLabel, entryShortDescriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.contentMode = .scaleAspectFit
        stackView.axis = .vertical
        return stackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.addSubview(entryImageView)
        self.contentView.addSubview(stackView)

        activateEntryImageViewConstraint()
        activateStackViewConstraint()
    }
    
    private func activateEntryImageViewConstraint() {
        NSLayoutConstraint.activate([
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            entryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: entryImageView.bottomAnchor, constant: 10)
        ])
    }
    
    private func activateStackViewConstraint() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    func configureContentsView(image: UIImage?, name: String, shortDescription: String) {
        self.entryImageView.image = image
        self.entryNameLabel.text = name
        self.entryShortDescriptionLabel.text = shortDescription
    }
}
