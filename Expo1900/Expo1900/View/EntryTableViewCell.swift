//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
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
        return label
    }()
    
    private let shortDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.numberOfLines = 0
        return label
    }()
        
    private let verticalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .equalSpacing
        stackview.translatesAutoresizingMaskIntoConstraints = false

        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
    }
    
    @available(*, unavailable)
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

// - MARK: View Settings

extension EntryTableViewCell {
    private func addSubView() {
        contentView.addSubview(entryImage)
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(shortDescription)
        
        setUpUIConstraints()
    }
    
    private func setUpUIConstraints() {
        NSLayoutConstraint.activate([
            entryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            entryImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            verticalStackView.leadingAnchor.constraint(equalTo: entryImage.trailingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            verticalStackView.centerYAnchor.constraint(equalTo: entryImage.centerYAnchor),
        ])
    }
    
    func configure(with data: EntryEntity) {
        self.entryImage.image = data.image
        self.titleLabel.text = data.name
        self.shortDescription.text = data.shortDescription
    }
}
