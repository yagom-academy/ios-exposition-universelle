//
//  ExpositionItemTableViewCell.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemTableViewCell: UITableViewCell {
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return imageView
    }()
    
    let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = .zero
        
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = .zero
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(informationStackView)
        informationStackView.addArrangedSubview(nameLabel)
        informationStackView.addArrangedSubview(shortDescriptionLabel)
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: ConstraintsNamespace.imageViewFromCellTop
            ),
            itemImageView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor,
                constant: ConstraintsNamespace.imageViewFromCellBottom
            ),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor,
                constant: ConstraintsNamespace.imageViewFromCellLeft
            ),
            itemImageView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: MultiplierNamespace.itemCellImageWidthToCell
            ),
            itemImageView.heightAnchor.constraint(lessThanOrEqualTo: itemImageView.widthAnchor),
            
            informationStackView.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: ConstraintsNamespace.stackViewFromCellTop
            ),
            informationStackView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor,
                constant: ConstraintsNamespace.stackViewFromCellBottom
            ),
            informationStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            informationStackView.leftAnchor.constraint(
                equalTo: itemImageView.rightAnchor,
                constant: ConstraintsNamespace.cellSpacingBetweenLabelAndImage
            ),
            informationStackView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 1 - MultiplierNamespace.itemCellImageWidthToCell,
                constant: ConstraintsNamespace.stackViewFromCellWidth
            )
        ])
    }
    
    func inputDataToCell(data: ExpositionItemEntity) {
        self.itemImageView.image = UIImage(named: data.imageName)
        self.nameLabel.text = data.name
        self.shortDescriptionLabel.text = data.shortDescription
        self.accessoryType = .disclosureIndicator
    }
}
