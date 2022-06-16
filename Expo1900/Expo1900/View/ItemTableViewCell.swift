//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    var itemInfo: Entry? {
        didSet {
            guard let image = itemInfo?.imageName else { return }
            itemTitleLabel.text = itemInfo?.name
            itemImageView.image = UIImage(named: image)
            itemShortDescriptionLable.text = itemInfo?.shortDescription
        }
    }
    
    private lazy var itemTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var itemShortDescriptionLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var itemLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemTitleLabel, itemShortDescriptionLable])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return stackView
    }()
    
    private lazy var itemStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemImageView, itemLabelStackView])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
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
    
    private func setupConfigure() {
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
