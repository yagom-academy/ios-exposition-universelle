//
//  HeritageViewCell.swift
//  Expo1900
//
//  Created by Danny, Gray on 2024/03/14.
//

import UIKit

class HeritageViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let itemInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private func addCell() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(itemInformationStackView)
        itemInformationStackView.addArrangedSubview(titleLabel)
        itemInformationStackView.addArrangedSubview(shortDescriptionLabel)
        
        setUpCellConstraints()
    }
    
    private func setUpCellConstraints() {

        NSLayoutConstraint.activate([
            contentView.trailingAnchor.constraint(equalTo: itemInformationStackView.trailingAnchor, constant: 12),
            contentView.bottomAnchor.constraint(equalTo: itemInformationStackView.bottomAnchor, constant: 16),
            itemInformationStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            itemInformationStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
            itemImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
