//
//  ExhibitionListTableViewCell.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

final class ExhibitionListTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var shortDescriptionLabel: UILabel!
    @IBOutlet private weak var exhibitionImageView: UIImageView!

    static let identifier: String = "ExhibitionListTableViewCell"
    var text: String {
        guard let text = nameLabel.text else {
            return Constant.emptyText
        }
        return text
    }
    
    func configure(_ item : Exhibition) {
        exhibitionImageView.image = UIImage(named: item.imageName)
        shortDescriptionLabel.text = item.shortDescription
        nameLabel.text = item.name
    }
}
