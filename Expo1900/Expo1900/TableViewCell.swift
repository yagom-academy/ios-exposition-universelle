//
//  TableViewCell.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/16.
//

import UIKit

class TableViewCell: UITableViewCell {
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addStackView()
        addView()
        constraintLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(shortDescriptionLabel)
    }
    
    private func addView() {
        self.contentView.addSubview(itemImageView)
        self.contentView.addSubview(stackView)
    }
    
    private func constraintLayout() {
        itemImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        itemImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5).isActive = true
        stackView.topAnchor.constraint(equalTo: itemImageView.topAnchor).isActive = true
    }
}
