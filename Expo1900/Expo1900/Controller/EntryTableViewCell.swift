//
//  TableViewCell.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/28.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    func insertCellData(from data: Entry) {
        self.entryImage.image = UIImage(named: data.imageName)
        self.entryNameLabel.text = data.name
        self.shortDescriptionLabel.text = data.shortDescription
    }
}
