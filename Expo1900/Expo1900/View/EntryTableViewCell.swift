//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/22.
//
import UIKit

final class EntryTableViewCell: UITableViewCell {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.alignment = .leading
        
        return stackView
    }()
    
    let entryImageView: UIImageView = {
        let entryImageView = UIImageView()
        entryImageView.translatesAutoresizingMaskIntoConstraints = false
        entryImageView.contentMode = .scaleAspectFit
        
        return entryImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAutoLayout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(entryImageView)
        contentView.addSubview(stackView)
        
        entryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        entryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0).isActive = true
        entryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        entryImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: entryImageView.trailingAnchor, constant: 10.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
