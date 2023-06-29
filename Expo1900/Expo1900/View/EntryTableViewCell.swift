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
        
        setUpTitleAndShortDescriptionLabel()
        
        let entryTextStackView = createEntryTextStackView(arrangedSubviews: [entryNameLabel, shortDescriptionLabel])
        
        contentView.addSubview(entryImageView)
        contentView.addSubview(entryTextStackView)
        
        setUpEntryImageViewConstraints()
        setUpEntryTextStackViewConstraints(for: entryTextStackView)
        
        accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with entry: Entry) {
        entryNameLabel.text = entry.name
        shortDescriptionLabel.text = entry.shortDescription
        entryImageView.image = UIImage(named: entry.imageName)
    }

    private func setUpTitleAndShortDescriptionLabel() {
        entryNameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        shortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        shortDescriptionLabel.numberOfLines = 0
    }
    
    private func createEntryTextStackView(arrangedSubviews: [UILabel]) -> UIStackView {
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
            entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
    
    private func setUpEntryTextStackViewConstraints(for stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: entryImageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
