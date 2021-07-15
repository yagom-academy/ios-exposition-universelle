//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 편대호 on 2021/07/12.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    func configure(itemImage: UIImage, itemDescription: String) {
        itemImageView.image = itemImage
        itemDescriptionLabel.text = itemDescription
    }
    
}
