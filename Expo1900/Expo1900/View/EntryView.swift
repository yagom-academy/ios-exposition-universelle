//
//  EntryView.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/16.
//

import UIKit

class EntryView: UIView {
    private let entryScrollView = UIScrollView()
    private let entryStackView = UIStackView()
    private let entryImageView = UIImageView()
    private let entryDescriptionLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(entryScrollView)
        
        setEntryScrollView()
        setEntryStackView()
        setEntryImageView()
        setEntryDescriptionLabel(in: .body)
    }
    
    func putEntryData(from entry: Exposition.Entry) {
        entryImageView.image = UIImage(named: entry.imageName)
        entryDescriptionLabel.text = entry.description
    }
    
    private func setEntryScrollView() {
        entryScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            entryScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            entryScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            entryScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            entryScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        entryScrollView.addSubview(entryStackView)
    }
    
    private func setEntryStackView() {
        entryStackView.axis = .vertical
        entryStackView.spacing = 10
        entryStackView.translatesAutoresizingMaskIntoConstraints = false
        entryStackView.layoutMargins = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        entryStackView.isLayoutMarginsRelativeArrangement = true
        
        let heightConstraint = entryStackView.heightAnchor.constraint(equalTo: entryScrollView.frameLayoutGuide.heightAnchor)
        heightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            entryStackView.topAnchor.constraint(equalTo: entryScrollView.topAnchor),
            entryStackView.bottomAnchor.constraint(equalTo: entryScrollView.bottomAnchor),
            entryStackView.leadingAnchor.constraint(equalTo: entryScrollView.leadingAnchor),
            entryStackView.trailingAnchor.constraint(equalTo: entryScrollView.trailingAnchor),
            entryStackView.widthAnchor.constraint(lessThanOrEqualTo: entryScrollView.widthAnchor, multiplier: 1),
            heightConstraint
        ])
        
        entryStackView.addArrangedSubview(entryImageView)
        entryStackView.addArrangedSubview(entryDescriptionLabel)
    }
    
    private func setEntryImageView() {
        entryImageView.contentMode = .scaleAspectFit
        entryImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            entryImageView.heightAnchor.constraint(lessThanOrEqualTo: entryImageView.widthAnchor)
        ])
    }
    
    private func setEntryDescriptionLabel(in textStyle: UIFont.TextStyle) {
        entryDescriptionLabel.font = UIFont.preferredFont(forTextStyle: textStyle)
        entryDescriptionLabel.adjustsFontForContentSizeCategory = true
        entryDescriptionLabel.numberOfLines = 0
    }
}
