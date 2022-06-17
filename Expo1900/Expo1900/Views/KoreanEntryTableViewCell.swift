//
//  KoreanEntryTableViewCell.swift
//  Expo1900
//
//  Created by Gordon Choi on 2022/06/17.
//

import UIKit

class KoreanEntryTableViewCell: UITableViewCell {
    var entryImageView: UIImageView!
    var titleLabel: UILabel!
    var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        entryImageView = UIImageView()
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(entryImageView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        
        shortDescriptionLabel = UILabel()
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, shortDescriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            entryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: entryImageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: entryImageView.bottomAnchor)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
