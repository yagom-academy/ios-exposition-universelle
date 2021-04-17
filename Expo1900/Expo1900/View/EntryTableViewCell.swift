//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/15.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    private let entryImageView = UIImageView()
    private let entryNameLabel = UILabel()
    private let entryShortDescriptionLabel = UILabel()
    private let contentStackView = UIStackView()
    private let entryLabelStackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.accessoryType = .disclosureIndicator
        contentView.addSubview(contentStackView)
        
        setContentStackView()
        setEntryLabelStackView()
        setEntryImageView(withRatioOf: 0.21)
        setEntryNameLabel(in: .title1)
        setEntryShortDescriptionLabel(in: .body)
    }
    
    func putEntryData(from entry: Exposition.Entry) {
        entryImageView.image = UIImage(named: entry.imageName)
        entryNameLabel.text = entry.name
        entryShortDescriptionLabel.text = entry.shortDescription
    }
    
    private func setContentStackView() {
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .fill
        contentStackView.spacing = 8
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11)
        ])
         
        contentStackView.addArrangedSubview(entryImageView)
        contentStackView.addArrangedSubview(entryLabelStackView)
    }
    
    private func setEntryLabelStackView() {
        entryLabelStackView.axis = .vertical
        entryLabelStackView.alignment = .fill
        entryLabelStackView.distribution = .fill
        entryLabelStackView.spacing = 0
        entryLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        entryLabelStackView.addArrangedSubview(entryNameLabel)
        entryLabelStackView.addArrangedSubview(entryShortDescriptionLabel)
    }
    
    private func setEntryImageView(withRatioOf sizeRatio: CGFloat) {
        entryImageView.contentMode = .scaleAspectFit
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            entryImageView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor, multiplier: sizeRatio),
            entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor)
        ])
    }
    
    private func setEntryNameLabel(in textStyle: UIFont.TextStyle) {
        entryNameLabel.font = UIFont.preferredFont(forTextStyle: textStyle)
        entryNameLabel.adjustsFontForContentSizeCategory = true
        entryNameLabel.numberOfLines = 0
    }
    
    private func setEntryShortDescriptionLabel(in textStyle: UIFont.TextStyle) {
        entryShortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: textStyle)
        entryNameLabel.adjustsFontForContentSizeCategory = true
        entryShortDescriptionLabel.numberOfLines = 0
    }
}
