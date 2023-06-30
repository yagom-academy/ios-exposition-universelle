//
//  KoreaEntryTableViewCell.swift
//  Expo1900
//
//  Created by MARY on 2023/06/30.
//

import UIKit

class KoreaEntryTableViewCell: UITableViewCell {
    let entryImageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let shortDescLabel: UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
		self.accessoryType = .disclosureIndicator
        setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpUI() {
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(entryImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .black
        
        shortDescLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescLabel.font = UIFont.preferredFont(forTextStyle: .body)
        shortDescLabel.adjustsFontForContentSizeCategory = true
        shortDescLabel.textColor = .black
        shortDescLabel.numberOfLines = 0
        
        let containerStackView = UIStackView(arrangedSubviews: [titleLabel, shortDescLabel])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.alignment = .fill
        containerStackView.distribution = .fill
        containerStackView.spacing = 8
        containerStackView.axis = .vertical
        contentView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            containerStackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
