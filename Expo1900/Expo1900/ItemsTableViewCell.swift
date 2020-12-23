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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
