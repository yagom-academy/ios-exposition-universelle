//
//  HeritageViewCell.swift
//  Expo1900
//
//  Created by Danny, Gray on 2024/03/14.
//

import UIKit

class HeritageViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private func addCell() {
        contentView.addSubview(titleLabel)
        
        setUpCellConstraints()
    }
    
    private func setUpCellConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
