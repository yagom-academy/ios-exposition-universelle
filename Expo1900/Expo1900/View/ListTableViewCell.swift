//
//  ListTableViewCell.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    private(set) var expoDescription: String = ""
    private(set) var expoImageName: String = ""
    
    private(set) var expoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private(set) var expoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) var expoShortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func configureCellData(expoItem: ExpoItem) {
        expoTitleLabel.text = expoItem.name
        expoShortDescriptionLabel.text = expoItem.shortDescription
        expoShortDescriptionLabel.numberOfLines = 0
        expoImageView.image = UIImage(named: expoItem.imageName)
        expoDescription = expoItem.description
        expoImageName = expoItem.imageName
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(expoImageView)
        contentView.addSubview(expoTitleLabel)
        contentView.addSubview(expoShortDescriptionLabel)
        
        NSLayoutConstraint.activate([
            expoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            expoImageView.widthAnchor.constraint(equalToConstant: 75),
            expoImageView.heightAnchor.constraint(equalToConstant: 75),
            expoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            expoTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            expoTitleLabel.leadingAnchor.constraint(equalTo: expoImageView.trailingAnchor, constant: 10),
            expoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            expoShortDescriptionLabel.topAnchor.constraint(equalTo: expoTitleLabel.bottomAnchor, constant: 5),
            expoShortDescriptionLabel.leadingAnchor.constraint(equalTo: expoTitleLabel.leadingAnchor),
            expoShortDescriptionLabel.trailingAnchor.constraint(equalTo: expoTitleLabel.trailingAnchor),
            expoShortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
