//
//  itemDescriptionUIScrollView.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

final class ItemDescriptionUIScrollView: UIScrollView {
    
    var itemDetailInfo: Entry? {
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
        
        setupItemStackViewConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setupItemStackViewConstraints() {
        addSubview(itemStackView)
        
        [itemImageView, itemDescriptionLabel].forEach {
            itemStackView.addArrangedSubview($0)
        }
        
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            itemStackView.widthAnchor.constraint(equalTo: widthAnchor),
            itemStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
