//
//  KoreaItemsTableViewCell.swift
//  Expo1900
//
//  Created by NAMU on 2022/06/18.
//

import UIKit

class KoreaItemsTableViewCell: UITableViewCell {
    
    let koreaItemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    let koreaItemsSubStackView: UIStackView = {
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
        label.numberOfLines = 0
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(koreaItemsStackView)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        let storeUIView = [itemImageView, koreaItemsSubStackView]
        storeUIView.forEach { koreaItemsStackView.addArrangedSubview($0) }
        
        let subStoreUIView = [titleLabel, shortDescriptionLabel]
        subStoreUIView.forEach { koreaItemsSubStackView.addArrangedSubview($0) }
        
        koreaItemsStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        koreaItemsStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        koreaItemsStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        koreaItemsStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        koreaItemsSubStackView.widthAnchor.constraint(equalTo: self.itemImageView.widthAnchor, multiplier: 4).isActive = true
    }
}
