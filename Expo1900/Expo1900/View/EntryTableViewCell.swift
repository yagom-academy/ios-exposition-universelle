//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/8/24.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet var entryImageView: UIImageView!
    @IBOutlet var entryNameLabel: UILabel!
    @IBOutlet var entryShortDescriptionLabel: UILabel!
    
    func setCellComponents(with entry: Entry) {
        self.entryImageView.image = UIImage(named: entry.imageName)
        self.entryNameLabel.text = entry.name
        self.entryShortDescriptionLabel.text = entry.shortDescription
    }
}
