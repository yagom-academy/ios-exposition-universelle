//
//  KoreaItemsTableViewCell.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/18.
//

import UIKit

final class KoreaItemTableViewCell: UITableViewCell {
    //MARK: - Setting Identifier
    
    static var identifier: String {
        return "KoreaItemTableViewCell"
    }
    
    //MARK: - KoreaItem Cell View
    
    private let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = DetailSetUp.stackViewSpacing
        return stackView
    }()
    
    private let itemSubStackView: UIStackView = {
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
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = DetailSetUp.labelNumberOfLines
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = DetailSetUp.labelNumberOfLines
        return label
    }()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(itemStackView)
        
        addItemStackView()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting View Methods
    
    private func addItemStackView() {
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
        itemSubStackView.widthAnchor.constraint(equalTo: self.itemImageView.widthAnchor
                                                , multiplier: DetailSetUp.subStacViewWidthMultiplier).isActive = true
        itemImageView.heightAnchor.constraint(lessThanOrEqualToConstant: DetailSetUp.imageViewMaxHeight).isActive = true
    }
}

//MARK: - NameSpace for Setting View Detail Option

extension KoreaItemTableViewCell {
    enum DetailSetUp {
        static let stackViewSpacing: CGFloat = 5
        static let labelNumberOfLines = 0
        static let subStacViewWidthMultiplier: CGFloat = 4
        static let imageViewMaxHeight: CGFloat = 80
    }
}

