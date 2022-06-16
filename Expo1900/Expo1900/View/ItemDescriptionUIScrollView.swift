//
//  itemDescriptionUIScrollView.swift
//  Expo1900
//
//  Created by Kiwon Song on 2022/06/16.
//

import UIKit

class ItemDescriptionUIScrollView: UIScrollView {
    
    let contentView = UIView()
    var itemDetailInfo: Entry? {
        didSet {
            guard let image = itemDetailInfo?.imageName else { return }
            itemImageView.image = UIImage(named: image)
            itemDescriptionLabel.text = itemDetailInfo?.desc
        }
    }
    
    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var itemStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemImageView, itemDescriptionLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        contentView.addSubview(stackView)
        return stackView
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            itemStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
