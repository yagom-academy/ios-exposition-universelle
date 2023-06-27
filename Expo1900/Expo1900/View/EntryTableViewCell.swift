//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    var entryImageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var shortDescriptionLabel: UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(entryImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        shortDescriptionLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, shortDescriptionLabel])
        
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: entryImageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
