//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryShortDescriptionLabel: UILabel!
    
    func setCustomCellComponents(image: String, title: String, shortDescription: String) {
        entryImage.image = UIImage(named: image)
        entryTitleLabel.text = title
        entryShortDescriptionLabel.text = shortDescription
    }
}
