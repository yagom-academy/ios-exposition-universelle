//
//  TableViewCell.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/26.
//

import UIKit

final class TableViewCell: UITableViewCell {
    static let cellIdentifier: String = NameSpace.cellID
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    lazy var workImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        detailLabel.adjustsFontForContentSizeCategory = true
        
        return detailLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    func layout() {
        setStackViewSubView()
        setConstraints()
    }
    
    private func setConstraints() {
        setWorkImageViewConstraints()
        setStackViewConstraints()
    }
    
    private func setStackViewSubView() {
        [titleLabel, detailLabel].forEach { stackView.addArrangedSubview($0) }
        accessoryType = .disclosureIndicator
    }
    
    private func setStackViewConstraints() {
        self.contentView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        self.stackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                            constant: 8),
        self.stackView.leadingAnchor.constraint(equalTo: workImageView.trailingAnchor,
                                                constant: 20),
        self.stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -20),
        self.stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                               constant: -8),
        self.stackView.centerYAnchor.constraint(equalTo: workImageView.centerYAnchor)
        ])
    }
    
    private func setWorkImageViewConstraints() {
        self.contentView.addSubview(workImageView)
        self.workImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.workImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                                    constant: 8),
            self.workImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                                       constant: -8),
            self.workImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: 10),
            self.workImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor,
                                                      multiplier: 0.3),
            self.workImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.workImageView.widthAnchor.constraint(equalTo: workImageView.heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
