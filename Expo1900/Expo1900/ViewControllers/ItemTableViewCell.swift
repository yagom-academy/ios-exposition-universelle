//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/12.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemShortDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    var itemDescription: String?
    var itemImageName: String?

}
