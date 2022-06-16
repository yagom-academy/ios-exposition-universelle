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
            testLabel.text = itemInfo?.name
        }
    }
    
    let testLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
//    lazy var itemImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: )
//        return imageView
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(testLabel)
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: topAnchor),
            testLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            testLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            testLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
