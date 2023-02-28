//
//  Expo1900 - CustomTableViewCell.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func configure(exhibitItem: ExhibitItem) {
        titleLabel.text = exhibitItem.name
        subTitleLabel.text = exhibitItem.shortDescription
        itemImageView.image = UIImage(named: exhibitItem.imageName)
    }
}
