//
//  KoreaExpositionCustomCell.swift
//  Expo1900
//
//  Created by Kim Do hyung on 2021/07/07.
//

import UIKit

class KoreaExpositionCustomCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    func configuateCell(item: KoreaExposition) {
        itemImage.image = UIImage(named: item.imageName)
        titleLabel.text = item.name
        shortDescriptionLabel.text = item.shortDescription
    }
}
