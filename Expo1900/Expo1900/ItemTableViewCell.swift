//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/16.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageNameView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    lazy var subStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(shortDescriptionLabel)
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(imageNameView)
        self.contentView.addSubview(subStackView)
        
        updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()

        imageNameView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        imageNameView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.2).isActive = true
        imageNameView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        imageNameView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        subStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        subStackView.leadingAnchor.constraint(equalTo: imageNameView.trailingAnchor, constant: 10).isActive = true
        subStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        subStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    }
}
