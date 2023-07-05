//
//  ExhibitCell.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExhibitCell: UITableViewCell {
    private let exhibitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with exhibit: ExhibitionItem) {
        exhibitImageView.image = UIImage(named: exhibit.imageName)
        nameLabel.text = exhibit.name
        shortDescriptionLabel.text = exhibit.shortDescription
    }
}

private extension ExhibitCell {
    func configureCellViews() {
        contentView.addSubview(exhibitImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(shortDescriptionLabel)
    }
    
    func configureConstraints() {
        exhibitImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            exhibitImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            exhibitImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            exhibitImageView.widthAnchor.constraint(equalToConstant: 80),
            exhibitImageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: exhibitImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            shortDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            shortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
