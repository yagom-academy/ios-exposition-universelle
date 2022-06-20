//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/16.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(shortDescriptionLabel)
        return stackView
    }()
    
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
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(itemImageView)
        self.contentView.addSubview(labelStackView)
        designateItemImageViewConstraints()
        designateLabelStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func designateItemImageViewConstraints() {
        itemImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.2).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func designateLabelStackViewConstraints() {
        labelStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func parseData(from model: [Item]?, with indexPath: IndexPath) {
        guard let model = model else { return }
        nameLabel.text = "\(String(describing: model[indexPath.row].name))"
        shortDescriptionLabel.text = "\(String(describing: model[indexPath.row].shortDescription))"
        itemImageView.image = UIImage(named: model[indexPath.row].imageName)
        accessoryType = .disclosureIndicator
    }
}
