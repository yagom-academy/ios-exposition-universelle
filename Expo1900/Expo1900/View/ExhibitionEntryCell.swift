//
//  ExhibitionEntryCell.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/22.
//

import UIKit

final class ExhibitionEntryCell: UITableViewCell {
    
    static let identifier = "ExhibitionEntryCell"

    let innerStackView = UIStackView()

    var data: ExhibitionItem? {
        didSet {
            self.exhibitionImage.image = data?.image
            self.titleLabel.text = data?.name
            self.contentLabel.text = data?.shortDescription
        }
    }
    
    private var exhibitionImage = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var titleLabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    private var contentLabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let stackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = LayoutConstant.spacing
        
        return stack
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        configureStackView()
        configureExhibitionImage()
        configureLabels()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.data = nil
    }
    
    private func configureStackView() {
        self.contentView.addSubview(stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func configureExhibitionImage() {
        self.stackView.addArrangedSubview(exhibitionImage)
        
        let widthMultiplier = 0.2
        
        let heightAnchor = exhibitionImage.widthAnchor.constraint(equalTo: exhibitionImage.heightAnchor)
        heightAnchor.priority = .defaultHigh
        heightAnchor.isActive = true

        NSLayoutConstraint.activate([
            exhibitionImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: widthMultiplier)
        ])
    }
    
    private func configureLabels() {
        let innerStackView = UIStackView()
        
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.axis = .vertical
        innerStackView.alignment = .leading
        innerStackView.distribution = .fill
        innerStackView.spacing = 0
        
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(contentLabel)
        
        stackView.addArrangedSubview(innerStackView)
    }
}
