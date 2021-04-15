//
//  KoreanItemCell.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

final class KoreanItemCell: UITableViewCell {
    static let reuseIdentifier = "KoreanItemCell"
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakStrategy = .hangulWordPriority
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpKoreanItemCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpKoreanItemCell() {
        setAccessoryType()
        addContentView()
        setConstraintsOfContents()
    }
    
    private func setAccessoryType() {
        accessoryType = .disclosureIndicator
    }
    
    private func addContentView() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(shortDescriptionLabel)
    }
    
    private func setConstraintsOfContents() {
        setConstraintsOfLabels()
        setConstraintsOfImageViews()
    }
    
    private func setConstraintsOfLabels() {
        setConstraintsOfTitleLabel()
        setConstraintsOfShortDescriptionLabel()
    }
    private func setConstraintsOfImageViews() {
        setConstraintsOfItemImageView()
    }

    private func setConstraintsOfItemImageView() {
        NSLayoutConstraint.activate([
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 100),
            itemImageView.heightAnchor.constraint(equalToConstant: 60),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setConstraintsOfTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: shortDescriptionLabel.topAnchor)
        ])
    }

    private func setConstraintsOfShortDescriptionLabel() {
        NSLayoutConstraint.activate([
            shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            shortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
