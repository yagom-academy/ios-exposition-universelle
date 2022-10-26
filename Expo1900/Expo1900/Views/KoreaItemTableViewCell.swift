//
//  KoreaItemTableViewCell.swift
//  Expo1900
//
//  Created by parkhyo on 2022/10/25.
//

import UIKit

final class KoreaItemTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "itemCell"
    
    private enum Constant {
        static let mainImageViewleadingConstraint: CGFloat = 20
        static let mainImageViewWidth: CGFloat = 100
        static let stackViewTopConstraint: CGFloat = 20
        static let stackViewBottomConstraint: CGFloat = -20
        static let stackViewLeadingConstraint: CGFloat = 10
        static let stackViewTrailingConstraint: CGFloat = -10
    }
    
    public let mainImageView: UIImageView = {
        let itemImageView = UIImageView()
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        return itemImageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let discriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
        setupConstraints()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension KoreaItemTableViewCell {
    
    private func setViews() {
        self.backgroundColor = .white
        contentView.addSubview(mainImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(discriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.mainImageViewleadingConstraint),
            
            mainImageView.widthAnchor.constraint(equalToConstant: Constant.mainImageViewWidth),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.stackViewTopConstraint),
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: Constant.stackViewLeadingConstraint),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constant.stackViewTrailingConstraint),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constant.stackViewBottomConstraint),
        ])
    }
}
