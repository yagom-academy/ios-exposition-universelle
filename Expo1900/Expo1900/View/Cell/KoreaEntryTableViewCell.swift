//
//  KoreaEntryTableViewCell.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/30.
//

import UIKit

protocol CellIdentifiable {
    static var reuseIdentifier : String { get }
}

final class KoreaEntryTableViewCell: UITableViewCell, CellIdentifiable {
    static let reuseIdentifier = "KoreaEntryTableViewCell"
    
    private let entryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: CommonLabel = {
        let label = CommonLabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: CommonLabel = {
        let label = CommonLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        configureUI()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [entryImageView, titleLabel, descriptionLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        setUpImageViewConstraints()
        setUpTitleLabelConstraints()
        setUpDescriptionLabelConstraints()
    }
}

// MARK: - Set Entry Information
extension KoreaEntryTableViewCell {
    func configure(with exposionItem: ExpositionItem) {
        titleLabel.text = exposionItem.name
        descriptionLabel.text = exposionItem.shortDescription
        entryImageView.image = UIImage(named: exposionItem.imageName)
    }
}

// MARK: - Constraints
extension KoreaEntryTableViewCell {
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            entryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entryImageView.widthAnchor.constraint(equalToConstant: 70),
            entryImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 70)
        ])
    }
    
    private func setUpTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func setUpDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
