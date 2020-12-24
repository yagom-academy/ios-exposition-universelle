//
//  KoreaItemTableViewCell.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import UIKit

class KoreaItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemShortDescriptionLabel: UILabel!
    
    func setUI(data: KoreaItem) {
        itemImageView.image = UIImage(named: data.imageName)
        itemTitleLabel.text = data.name
        itemShortDescriptionLabel.text = data.shortDescription
    }
}
