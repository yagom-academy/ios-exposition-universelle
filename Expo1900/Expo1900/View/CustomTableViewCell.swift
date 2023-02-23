//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by Hyejeong Jeong on 2023/02/23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    private let entryImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let entryNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private let entryShortDescriptionLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEntryList(image: String, name: String, shortDescription: String) {
        self.entryImageView.image = UIImage(named: image)
        self.entryNameLabel.text = name
        self.entryShortDescriptionLabel.text = shortDescription
    }
    
    private func configureUI() {
        addSubview(entryImageView)
        addSubview(entryNameLabel)
        addSubview(entryShortDescriptionLabel)
        self.accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            entryImageView.topAnchor.constraint(equalTo: self.topAnchor),
            entryImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            entryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            entryImageView.widthAnchor.constraint(equalToConstant: 80),
            entryImageView.heightAnchor.constraint(equalToConstant: 60),
            
            entryNameLabel.topAnchor.constraint(equalTo: entryImageView.topAnchor, constant: 8),
            entryNameLabel.leftAnchor.constraint(equalTo: entryImageView.rightAnchor, constant: 8),
            
            entryShortDescriptionLabel.topAnchor.constraint(equalTo: entryNameLabel.bottomAnchor, constant: 8),
            entryShortDescriptionLabel.leftAnchor.constraint(equalTo: entryImageView.rightAnchor, constant: 8),
            entryShortDescriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
}
