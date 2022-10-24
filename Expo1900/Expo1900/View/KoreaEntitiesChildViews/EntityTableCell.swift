//
//  EntityTableCell.swift
//  EntityTableCell
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.
        
import UIKit

class EntityTableCell: UITableViewCell {
    static let identifier = "EntityTableCell"
    
    private let entityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel = InformationLabel(alignment: .left, settingFont: UIFont.systemFont(ofSize: 25))
    private let subTitleLabel = InformationLabel(alignment: .left, settingFont: nil, lines: 0)
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        [entityImageView, stackView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setUpEntityImageViewLayout()
        setUpStackViewLayout()
        
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: entityImageView.heightAnchor).isActive = true
    }
    
    private func setUpEntityImageViewLayout() {
        NSLayoutConstraint.activate([
            entityImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entityImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entityImageView.heightAnchor.constraint(equalTo: entityImageView.widthAnchor, constant: 8)
        ])
        
    }
    
    private func setUpStackViewLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: entityImageView.trailingAnchor, constant: 8),
            stackView.centerYAnchor.constraint(equalTo: entityImageView.centerYAnchor)
        ])
    }
    
    func setViewData(entity: Entity) {
        titleLabel.text = entity.name
        subTitleLabel.text = entity.summary
        entityImageView.image = UIImage(named: entity.imageName)
    }
}
