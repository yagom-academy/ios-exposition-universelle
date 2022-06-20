//
//  KoreaItemsTableViewCell.swift
//  Expo1900
//
//  Created by NAMU on 2022/06/18.
//

import UIKit

class KoreaItemTableViewCell: UITableViewCell {
    //MARK: - KoreaItem Cell View
    
    let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    let itemSubStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 80).isActive = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(itemStackView)
        
        addUIItemStackView()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting View Methods
    
    private func addUIItemStackView() {
        let storeUIView = [itemImageView, itemSubStackView]
        storeUIView.forEach { itemStackView.addArrangedSubview($0) }
        
        let subStoreUIView = [titleLabel, shortDescriptionLabel]
        subStoreUIView.forEach { itemSubStackView.addArrangedSubview($0) }
    }
    
    private func setViewConstraints() {
        itemStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        itemStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        itemStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        itemSubStackView.widthAnchor.constraint(equalTo: self.itemImageView.widthAnchor, multiplier: 4).isActive = true
    }
}
