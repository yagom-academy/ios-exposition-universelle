//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by kjs on 2021/07/09.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemShortDescriptionLabel: UILabel!
    
    func configure(data: Item) {
        itemImageView.image = UIImage(named: data.imageName)
        itemNameLabel.text = data.name
        itemShortDescriptionLabel.text = data.shortDescription
    }
}
