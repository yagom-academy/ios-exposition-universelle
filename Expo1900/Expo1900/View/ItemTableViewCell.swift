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
            itemTitleLabel.text = itemInfo?.name
            itemImageView.image = itemInfo?.image
            itemShortDescriptionLable.text = itemInfo?.shortDescription
        }
    }
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let itemShortDescriptionLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let itemLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return stackView
    }()
    
    private let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(itemStackView)
        
        [itemTitleLabel, itemShortDescriptionLable].forEach {
            itemLabelStackView.addArrangedSubview($0)
        }
        
        [itemImageView, itemLabelStackView].forEach {
            itemStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
