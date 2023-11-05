//
//  EntryItemCell.swift
//  Expo1900
//
//  Created by hyunMac on 11/2/23.
//

import UIKit

class EntryItemCell: UITableViewCell {

    @IBOutlet weak var entryItemImage: UIImageView!
    @IBOutlet weak var entryItemTitle: UILabel!
    @IBOutlet weak var entryItemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
