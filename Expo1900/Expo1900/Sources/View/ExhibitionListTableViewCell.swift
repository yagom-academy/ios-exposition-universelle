//
//  ExhibitionListTableViewCell.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

final class ExhibitionListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var exhibitionImageView: UIImageView!

    var identifier: String?
    var text: String {
        guard let text = nameLabel.text else {
            return Constant.emptyText
        }
        return text
    }
}
