//
//  ExpoEntry.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit

class ExpoEntryCell: UITableViewCell {
    
    private var entryImageView: UIImageView!
    private var stackView: UIStackView!
    private var entryNameLabel: UILabel!
    private var entryShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        entryImageView = UIImageView()
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(entryImageView)
        
        entryNameLabel = UILabel()
        entryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        entryNameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        entryNameLabel.adjustsFontForContentSizeCategory = true
        entryNameLabel.numberOfLines = 0
        
        entryShortDescriptionLabel = UILabel()
        entryShortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        entryShortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        entryShortDescriptionLabel.adjustsFontForContentSizeCategory = true
        entryShortDescriptionLabel.numberOfLines = 0
        
        stackView = UIStackView(arrangedSubviews: [entryNameLabel, entryShortDescriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.contentMode = .scaleAspectFit
        stackView.axis = .vertical
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            entryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8.0),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    func configureContentsView(image: UIImage?, name: String, shortDescription: String) {
        self.entryImageView.image = image
        self.entryNameLabel.text = name
        self.entryShortDescriptionLabel.text = shortDescription
    }
}
