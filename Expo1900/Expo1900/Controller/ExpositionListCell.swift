//
//  ExpositionListCell.swift
//  Expo1900
//
//  Created by Terry Lee on 2021/07/08.
//

import UIKit

class ExpositionListCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var shortDescriptionLabel: UILabel!
    
    func updateUI(expositionItem: ExpositionItem) {
        nameLabel.text = expositionItem.name
        shortDescriptionLabel.text = expositionItem.shortDescription
        itemImageView.image = expositionItem.image
    }
}
