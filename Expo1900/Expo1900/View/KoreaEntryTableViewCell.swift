//
//  KoreaEntryTableViewCell.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/30.
//

import UIKit

final class KoreaEntryTableViewCell: UITableViewCell {
    private let entryImageView: UIImageView = UIImageView()
	private let titleLabel: UILabel = UILabel()
	private let shortDescLabel: UILabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.entryImageView.image = nil
        self.titleLabel.text = nil
        self.shortDescLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
		self.accessoryType = .disclosureIndicator
        setUpUI()
    }
	
	func configureCell(itemsModel: ItemsModel) {
		self.entryImageView.image = UIImage(named: itemsModel.imageName)
		self.titleLabel.text = itemsModel.name
		self.shortDescLabel.text = itemsModel.shortDesc
	}
    
    private func setUpUI() {
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(entryImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        shortDescLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescLabel.font = UIFont.preferredFont(forTextStyle: .body)
        shortDescLabel.adjustsFontForContentSizeCategory = true
        shortDescLabel.textColor = .black
        shortDescLabel.numberOfLines = 0
        
        let containerStackView = UIStackView(arrangedSubviews: [titleLabel, shortDescLabel])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.alignment = .fill
        containerStackView.distribution = .fill
        containerStackView.spacing = 8
        containerStackView.axis = .vertical
        contentView.addSubview(containerStackView)
        
        let entryImageWidthRatio = entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2)
        entryImageWidthRatio.priority = .init(999)
        entryImageWidthRatio.isActive = true
        entryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        entryImageView.widthAnchor.constraint(equalTo: entryImageView.heightAnchor).isActive = true
        entryImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 8).isActive = true
        containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
