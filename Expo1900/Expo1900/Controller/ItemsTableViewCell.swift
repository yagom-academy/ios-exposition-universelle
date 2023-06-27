//
//  ItemsTableViewCell.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/27.
//

import UIKit

final class ItemsTableViewCell: UITableViewCell {
    static let id = "itemTableViewCellID"
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var shortDesctionLabel: UILabel!
}
