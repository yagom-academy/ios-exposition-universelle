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
    
    private let contentStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        [titleLabel, descriptionLabel].forEach{ contentStackView.addArrangedSubview($0) }
        
        [entryImageView, contentStackView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        setUpImageViewConstraints()
        setUpContentStackViewConstraints()
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
    
    private func setUpContentStackViewConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentStackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
