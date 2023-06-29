//
//  ExpositionItemTableViewCell.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemTableViewCell: UITableViewCell {
    let image = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let informationStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }()
    
    let name = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    let shortDescription = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(image)
        contentView.addSubview(informationStackView)
        informationStackView.addArrangedSubview(name)
        informationStackView.addArrangedSubview(shortDescription)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            informationStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            informationStackView.leftAnchor.constraint(equalTo: image.rightAnchor)
        ])
    }
}
