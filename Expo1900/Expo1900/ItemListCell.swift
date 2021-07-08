//
//  ItemListCell.swift
//  Expo1900
//
//  Created by yun on 2021/07/08.
//

//UITABLEVIEWCELL cry() {eat()}
// |
// |
// |
//ItemListCell cry()  eat()

import UIKit

class ItemListCell: UITableViewCell {

    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var shortDescription: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
