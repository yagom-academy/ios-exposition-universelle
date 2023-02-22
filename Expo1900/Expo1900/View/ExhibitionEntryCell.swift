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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    var contentLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let stackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 0
        
        return stack
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessoryType = .disclosureIndicator
        configureStackView()
        configureExhibitionImage()
        configureLabels()
    }
    
    func configureStackView() {
        self.contentView.addSubview(stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10),
        ])
    }
    
    func configureExhibitionImage() {
        self.stackView.addArrangedSubview(exhibitionImage)
        
        NSLayoutConstraint.activate([
            exhibitionImage.widthAnchor.constraint(equalToConstant: 60),
            exhibitionImage.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureLabels() {
        let innerStackView = UIStackView()
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.axis = .vertical
        innerStackView.alignment = .fill
        innerStackView.distribution = .fill
        innerStackView.spacing = 0
        
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(contentLabel)
        
        stackView.addArrangedSubview(innerStackView)
    }
}
