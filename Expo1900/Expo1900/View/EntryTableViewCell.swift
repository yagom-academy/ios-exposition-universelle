//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/8/24.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet private var entryImageView: UIImageView!
    @IBOutlet private var entryNameLabel: UILabel!
    @IBOutlet private var entryShortDescriptionLabel: UILabel!
    
    func setCellComponents(with entry: Entry) {
        self.entryImageView.image = UIImage(named: entry.imageName)
        self.entryNameLabel.text = entry.name
        self.entryShortDescriptionLabel.text = entry.shortDescription
    }
}
