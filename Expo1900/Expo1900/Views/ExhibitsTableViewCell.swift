//
//  ExhibitsTableViewCell.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ExhibitsTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ExhibitsTableViewCell"
    
    //MARK: - Views
    private let exhibitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let exhibitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameShortDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let shortDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textColor = .label
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameShortDescriptionStackView.addArrangedSubview(nameLabel)
        nameShortDescriptionStackView.addArrangedSubview(shortDescriptionTextView)
        exhibitStackView.addArrangedSubview(exhibitImageView)
        exhibitStackView.addArrangedSubview(nameShortDescriptionStackView)
        contentView.addSubview(exhibitStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(exhibitStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor))
        constraints.append(exhibitStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor))
        constraints.append(exhibitStackView.topAnchor.constraint(equalTo: contentView.topAnchor))
        constraints.append(exhibitStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
