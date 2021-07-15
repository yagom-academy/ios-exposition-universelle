//
//  ListTableViewCell.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/10.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemShortDescriptionLabel: UILabel!
    
    func configure(itemImage: UIImage, itemName: String, itemShortDescription: String) {
        itemImageView.image = itemImage
        itemNameLabel.text = itemName
        itemShortDescriptionLabel.text = itemShortDescription
    }
}



