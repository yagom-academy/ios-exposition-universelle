//
//  ItemsTableViewCell.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/23.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCellContents(with item: Item) {
        let itemImage = UIImage(named: item.imageName)
        self.nameLabel.text = item.name
        self.shortDescriptionLabel.text = item.shortDescription
        self.itemImageView.image = itemImage
    }
}
