//
//  KoreanItemCell.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

final class KoreanItemCell: UITableViewCell {
    static let identifier = "KoreanItemCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        addContentView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func addContentView() {
        addSubview(itemImageView)
        addSubview(titleLabel)
        addSubview(shortDescriptionLabel)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            itemImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            shortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
