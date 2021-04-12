//
//  KoreanEntryTableViewCell.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

final class KoreanEntryTableViewCell: UITableViewCell {
    @IBOutlet weak var itemShortDescLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    func setCell(_ data: Item) {
        itemTitleLabel.text = data.name
        itemImageView.image = UIImage(named: data.imageName)
        itemShortDescLabel.text = data.shortDesc
    }
}
