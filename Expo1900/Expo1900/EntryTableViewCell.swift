//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by 임리나 on 2020/12/26.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var entryImageView: UIImageView!

    func setEntryInformation(_ data: Entry) {
        nameLabel.text = data.name
        descriptionLabel.text = data.shortDescription
        entryImageView.image = data.image
    }
}
