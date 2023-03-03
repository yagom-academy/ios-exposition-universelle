//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/27.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    func setContents(_ itemName: String, _ shortDescription: String, _ itemImage: UIImage?) {
        self.itemNameLabel.text = itemName
        self.shortDescriptionLabel.text = shortDescription
        self.itemImageView.image = itemImage
        self.accessoryType = .disclosureIndicator
    }
}
