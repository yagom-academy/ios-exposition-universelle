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
        constraintStackViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addStackView() {
        stackView.addArrangedSubview(itemImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(shortDescriptionLabel)
    }
    
    private func addView() {
        self.contentView.addSubview(stackView)
    }
    
    private func constraintStackViewLayout() {
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}
