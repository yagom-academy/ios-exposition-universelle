//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/27.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    static let id = "itemTableViewCellID"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDesctionLabel: UILabel!
}
