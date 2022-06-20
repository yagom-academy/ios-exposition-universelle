//
//  KoreanEntryTableViewCell.swift
//  Expo1900
//
//  Created by Gordon Choi on 2022/06/17.
//

import UIKit

class KoreanEntryTableViewCell: UITableViewCell, ReuseIdentifying {
    private var entryImageView: UIImageView!
    private var titleLabel: UILabel!
    private var shortDescriptionLabel: UILabel!
}

extension KoreanEntryTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageView()
        setupLabels()
    }
}

extension KoreanEntryTableViewCell {
    private func setupImageView() {
        entryImageView = UIImageView()
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(entryImageView)

        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            entryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor)
        ])
    }
    
    private func setupLabels() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        
        shortDescriptionLabel = UILabel()
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [titleLabel, shortDescriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: entryImageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: entryImageView.bottomAnchor)
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
