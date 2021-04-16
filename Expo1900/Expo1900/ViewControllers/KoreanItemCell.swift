//
//  KoreanItemCell.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

final class KoreanItemCell: UITableViewCell {
    static let reuseIdentifier = "KoreanItemCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let shortDescriptionLabel: UILabel = {
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
        addContentConstraints()
    }
    
    func setKoreanItemCellContents(imageName: String, title: String, shortDescription: String) {
        setItemImageView(imageName: imageName)
        setTitleLabel(title: title)
        setShortDescriptionLabel(shortDescription: shortDescription)
    }
    
    private func setItemImageView(imageName: String) {
        itemImageView.image = UIImage(named: imageName)
    }
    
    private func setTitleLabel(title: String) {
        titleLabel.text = title
    }
    
    private func setShortDescriptionLabel(shortDescription: String) {
        shortDescriptionLabel.text = shortDescription
    }
    
    private func setAccessoryType() {
        accessoryType = .disclosureIndicator
    }
    
    private func addContentView() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(shortDescriptionLabel)
    }
    
    private func addContentConstraints() {
        addImageViewConstraints()
        addLabelConstraints()
    }
    
    private func addLabelConstraints() {
        addTitleLabelConstraints()
        addShortDescriptionLabelConstraints()
    }
    private func addImageViewConstraints() {
        addItemImageViewConstraints()
    }
    
    private func addItemImageViewConstraints() {
        NSLayoutConstraint.activate([
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 100),
            itemImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let itemImageViewTopConstraint = NSLayoutConstraint(item: itemImageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 20)
        itemImageViewTopConstraint.priority = .defaultLow
        itemImageViewTopConstraint.isActive = true
        
        let itemImageViewBottomConstraint = NSLayoutConstraint(item: itemImageView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -20)
        itemImageViewBottomConstraint.priority = .defaultLow
        itemImageViewBottomConstraint.isActive = true
    }
    
    private func addTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: shortDescriptionLabel.topAnchor)
        ])
    }
    
    private func addShortDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            shortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
