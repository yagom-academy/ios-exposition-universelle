//
//  itemDescriptionUIScrollView.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

final class ItemDescriptionUIScrollView: UIView {
    
    private let itemDescriptionScrollView = UIScrollView()
    
    private var itemDetailInfo: Entry? {
        didSet {
            itemImageView.image = itemDetailInfo?.image
            itemDescriptionLabel.text = itemDetailInfo?.desc
        }
    }
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    private let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(itemDescriptionScrollView)
        
        itemDescriptionScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemDescriptionScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            itemDescriptionScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemDescriptionScrollView.widthAnchor.constraint(equalTo: widthAnchor),
            itemDescriptionScrollView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        itemImageView.contentMode = .scaleAspectFit
        
        setupItemStackViewConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setupItemStackViewConstraints() {
        itemDescriptionScrollView.addSubview(itemStackView)
        
        [itemImageView, itemDescriptionLabel].forEach {
            itemStackView.addArrangedSubview($0)
        }
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: itemDescriptionScrollView.topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: itemDescriptionScrollView.bottomAnchor),
            itemStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -25),
            itemStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func updateEntry(by entry: Entry?) {
        itemDetailInfo = entry
    }
}
