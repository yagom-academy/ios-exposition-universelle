//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    var entryImageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var shortDescriptionLabel: UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTitleAndShortDescriptionLabelSetting()
        
        let entryTextStackView = createEntryTextStackView(arrangedSubviews: [titleLabel, shortDescriptionLabel])
        
        contentView.addSubview(entryImageView)
        contentView.addSubview(entryTextStackView)
        
        setEntryImageViewConstraints()
        setEntryTextStackViewConstraints(for: entryTextStackView)
        
        accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setTitleAndShortDescriptionLabelSetting() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
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

extension EntryTableViewCell {
    private func setEntryImageViewConstraints() {
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor),
            entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
    
    private func setEntryTextStackViewConstraints(for stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: entryImageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
