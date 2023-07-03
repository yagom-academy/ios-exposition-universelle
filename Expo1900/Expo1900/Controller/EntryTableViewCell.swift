//
//  TableViewCell.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/28.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var entryNameLabel: UILabel!
    @IBOutlet private weak var shortDescriptionLabel: UILabel!
    
    func insertCellData(from data: Entry) {
        entryImage.image = UIImage(named: data.imageName)
        entryNameLabel.text = data.name
        shortDescriptionLabel.text = data.shortDescription
    }
}
