//
//  ExhibitionEntryCell.swift
//  Expo1900
//
//  Created by 강민수 on 2023/02/22.
//

import UIKit

class ExhibitionEntryCell: UITableViewCell {
    
    static let identifier = "ExhibitionEntryCell"
    
    var exhibitionImage = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var titleLabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    var contentLabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    private let stackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        
        return stack
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureStackView()
        configureExhibitionImage()
        configureLabels()
    }
    
    func configureStackView() {
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
    
    func configureExhibitionImage() {
        self.stackView.addArrangedSubview(exhibitionImage)
    }
    
    func configureLabels() {
        let innerStackView = UIStackView()
        innerStackView.axis = .vertical
        innerStackView.alignment = .fill
        innerStackView.distribution = .equalSpacing
        innerStackView.spacing = 5
        
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(contentLabel)
        
        stackView.addArrangedSubview(innerStackView)
    }
}
