//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by kjs on 2021/07/09.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemShortDescriptionLabel: UILabel!
    var itemLongDescription: String?
    
    func transfer(data: Item) {
        itemImageView.image = UIImage(named: data.imageName)
        itemNameLabel.text = data.name
        itemShortDescriptionLabel.text = data.shortDescription
        itemLongDescription = data.description
    }
}
