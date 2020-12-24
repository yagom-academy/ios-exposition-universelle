//
//  ListCell.swift
//  Expo1900
//
//  Created by sole on 2020/12/24.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    func updateCell(info: KoreaWorks) {
        imgView.image = info.image
        nameLabel.text = info.name
        shortDescriptionLabel.text = info.shortDescription
    }
}
