//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    private var entryImageView: UIImageView = UIImageView()
    private var entryNameLabel: UILabel = UILabel()
    private var shortDescriptionLabel: UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpEntryImageView()
        setUpEntryNameLabel()
        setUpShortDescriptionLabel()
        
        let entryTextStackView = configureEntryTextStackView(arrangedSubviews: [entryNameLabel, shortDescriptionLabel])
        
        contentView.addSubview(entryImageView)
        contentView.addSubview(entryTextStackView)
        
        setUpEntryImageViewConstraints()
        setUpEntryTextStackViewConstraints(for: entryTextStackView)
        
        accessoryType = .disclosureIndicator
    }
    
    func configureCell(with entry: Entry) {
        entryImageView.image = UIImage(named: entry.imageName)
        entryNameLabel.text = entry.name
        shortDescriptionLabel.text = entry.shortDescription
    }

    private func setUpEntryImageView() {
        entryImageView.contentMode = .scaleAspectFit
    }
    
    private func setUpEntryNameLabel() {
        entryNameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        entryNameLabel.adjustsFontForContentSizeCategory = true
        entryNameLabel.numberOfLines = 0
    }
    
    private func setUpShortDescriptionLabel() {
        shortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        shortDescriptionLabel.adjustsFontForContentSizeCategory = true
        shortDescriptionLabel.numberOfLines = 0
    }
    
    private func configureEntryTextStackView(arrangedSubviews: [UILabel]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        
        stackView.axis = .vertical
        stackView.spacing = 1
        
        return stackView
    }
}

//MARK: Constraints
extension EntryTableViewCell {
    private func setUpEntryImageViewConstraints() {
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            entryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 80),
        ])
    }
    
    private func setUpEntryTextStackViewConstraints(for stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
