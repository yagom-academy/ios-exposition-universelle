//
//  ExpositionTableViewCell.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class ExpositionTableViewCell: UITableViewCell {
    private let entryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .left
        return label
    }()
    
    private let shortDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        label.numberOfLines = 0
        return label
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let verticalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 0
        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        entryImage.image = nil
        titleLabel.text = nil
        shortDescription.text = nil
    }
}

extension ExpositionTableViewCell {
    private func addSubView() {
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(entryImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(shortDescription)
        
        setUpUIConstraints()
    }
    
    private func setUpUIConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            entryImage.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor, constant: 10)
        ])
    }
    
    func configure(with data: EntryEntity) {
        self.entryImage.image = data.image
        self.titleLabel.text = data.name
        self.shortDescription.text = data.shortDescription
    }
}
