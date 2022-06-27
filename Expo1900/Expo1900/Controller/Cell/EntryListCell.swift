//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

class EntryListCell: UITableViewCell {
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
        return title
    }()
    
    let shortDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0

        return description
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        stackView.alignment = .top
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubviews()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.contentView.addSubview(koreaEntryImage)
        self.contentView.addSubview(verticalStackView)
        setStackView()
    }
    
    func setConstraints() {
        self.setKoreaEntryImageConstraints()
        self.setStackViewConstraints()
    }
    
    private func setStackView() {
        self.verticalStackView.addArrangedSubview(koreaEntryTitle)
        self.verticalStackView.addArrangedSubview(shortDescription)
    }
    
    private func setKoreaEntryImageConstraints() {
        NSLayoutConstraint.activate([
            self.koreaEntryImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.koreaEntryImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.3),
            self.koreaEntryImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
   
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            self.verticalStackView.centerYAnchor.constraint(equalTo: koreaEntryImage.centerYAnchor),
            self.verticalStackView.leadingAnchor.constraint(equalTo: koreaEntryImage.trailingAnchor, constant: 10),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
}
