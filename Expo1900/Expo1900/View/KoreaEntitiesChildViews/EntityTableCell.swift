//
//  EntityTableCell.swift
//  EntityTableCell
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.
        
import UIKit

final class EntityTableCell: UITableViewCell {
    static let identifier = "EntityTableCell"
    
    private let entityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel = InformationLabel(alignment: .left, settingFont: UIFont.preferredFont(forTextStyle: .title1))
    private let subTitleLabel = InformationLabel(alignment: .left)
    
    private lazy var explainStackView: UIStackView = {
        let explainStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        explainStackView.axis = .vertical
        explainStackView.distribution = .fill
        explainStackView.alignment = .leading
        
        return explainStackView
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
    
    func setViewData(entity: Entity) {
        titleLabel.text = entity.name
        subTitleLabel.text = entity.summary
        entityImageView.image = UIImage(named: entity.imageName)
    }
}

private extension EntityTableCell {
    func setUpLayout() {
        [entityImageView, explainStackView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setUpEntityImageViewLayout()
        setUpStackViewLayout()
        
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: entityImageView.heightAnchor).isActive = true
    }
    
    func setUpEntityImageViewLayout() {
        NSLayoutConstraint.activate([
            entityImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            entityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            entityImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            entityImageView.heightAnchor.constraint(equalTo: entityImageView.widthAnchor, constant: 8)
        ])
        
    }
    
    func setUpStackViewLayout() {
        NSLayoutConstraint.activate([
            explainStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 20),
            explainStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            explainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            explainStackView.leadingAnchor.constraint(equalTo: entityImageView.trailingAnchor, constant: 8),
            explainStackView.centerYAnchor.constraint(equalTo: entityImageView.centerYAnchor)
        ])
    }
}
