//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/04/15.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    func itemInformation(data: ExhibitionWorks) {
        itemImageView.image = UIImage(named: data.imageName)
        itemNameLabel.text = data.name
        shortDescriptionLabel.text = data.shortDescription
    }
}
