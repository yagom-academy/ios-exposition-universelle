//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    var itemInfo: Entry? {
        didSet {
            guard let image = itemInfo?.imageName else { return }
            itemTitleLabel.text = itemInfo?.name
            itemImageView.image = UIImage(named: image)
            itemShortDescriptionLable.text = itemInfo?.shortDescription
        }
    }
    
    lazy var itemTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var itemShortDescriptionLable: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var itemLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemTitleLabel, itemShortDescriptionLable])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var itemStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemImageView, itemLabelStackView])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConfigure() {
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
