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
        configureInit()
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
    func configureInit() {
        addSubviews()
        addConstraintsExhibitImageView()
        addConstraintsNameLabel()
        addConstraintsShortDescriptionLabel()
    }
    
    func addSubviews() {
        contentView.addSubview(exhibitImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(shortDescriptionLabel)
    }
    
    func addConstraintsExhibitImageView() {
        exhibitImageView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            exhibitImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            exhibitImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            exhibitImageView.widthAnchor.constraint(equalToConstant: 80),
            exhibitImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func addConstraintsNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: exhibitImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func addConstraintsShortDescriptionLabel() {
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shortDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            shortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
