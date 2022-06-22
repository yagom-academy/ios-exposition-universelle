//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = ExpoNameSpace.cellIdentifier.name
    
    let koreaEntryImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let koreaEntryTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.setContentHuggingPriority(.required, for: .vertical)
        return title
    }()
    
    let shortDescription: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    //
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        stackView.alignment = .top
        return stackView
    }()
    
    func addSubviews() {
        self.contentView.addSubview(koreaEntryImage)
        self.contentView.addSubview(verticalStackView)
        setStackView()
    }
    
    func setConstraints() {
        self.setKoreaEntryImageConstraints()
        self.setStackViewConstraints()
        self.setCellConstraints()
        
    }
    
    func setStackView() {
        verticalStackView.addArrangedSubview(koreaEntryTitle)
        verticalStackView.addArrangedSubview(shortDescription)
    }
    
    func setKoreaEntryImageConstraints() {
        NSLayoutConstraint.activate([
            koreaEntryImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            koreaEntryImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            koreaEntryImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            koreaEntryImage.widthAnchor.constraint(equalToConstant: 100),
            koreaEntryImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        ])
    }
    
    func setKoreaEntryTitleConstraints() {
        NSLayoutConstraint.activate([
            koreaEntryTitle.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 8),
            koreaEntryTitle.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor)
        ])
    }
    
    func setShortDescriptionConstraints() {
        shortDescription.numberOfLines = 0
        NSLayoutConstraint.activate([
            shortDescription.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: 8),
            shortDescription.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor)
        ])
    }
    
    func setCellConstraints() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor),
        ])
    }
    
    func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: koreaEntryImage.trailingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
