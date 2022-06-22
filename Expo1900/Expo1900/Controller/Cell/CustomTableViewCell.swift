//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "customCell"
    
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
        return description
    }()
    
    func addSubviews() {
        self.contentView.addSubview(koreaEntryImage)
        self.contentView.addSubview(koreaEntryTitle)
        self.contentView.addSubview(shortDescription)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
            koreaEntryTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            koreaEntryTitle.leadingAnchor.constraint(equalTo: koreaEntryImage.trailingAnchor, constant: 8),
            koreaEntryTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            koreaEntryTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setShortDescriptionConstraints() {
        shortDescription.numberOfLines = 0
        NSLayoutConstraint.activate([
            shortDescription.topAnchor.constraint(equalTo: koreaEntryTitle.bottomAnchor, constant: 8),
            shortDescription.leadingAnchor.constraint(equalTo: koreaEntryImage.trailingAnchor, constant: 8),
            shortDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            shortDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            shortDescription.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func setCellConstraints() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: koreaEntryTitle.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: shortDescription.bottomAnchor)
        ])
    }
}
