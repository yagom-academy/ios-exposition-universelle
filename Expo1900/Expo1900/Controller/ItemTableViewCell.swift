//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 임지성 on 2021/12/09.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(of cell: ItemTableViewCell, by item: ExpositionItem) {
        itemImageView.image = UIImage(named: item.imageName)
        itemNameLabel.text = item.name
        itemShortDescriptionLabel.text = item.shortDescription
    }
}
