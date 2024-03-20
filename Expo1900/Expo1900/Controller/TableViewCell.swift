//
//  TableViewCell.swift
//  Expo1900
//
//  Created by H on 3/12/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with item: Item) {
        nameLabel.text = "\(item.name)"
        shortDescriptionLabel.text = "\(item.summary)"
        itemImageView.image = UIImage(named: "\(item.imageUrl)")
        accessoryType = .disclosureIndicator
    }
}
