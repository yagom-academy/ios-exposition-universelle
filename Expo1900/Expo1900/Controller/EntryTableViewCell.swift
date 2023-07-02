//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by kangkyungmin on 2023/07/02.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var entryShortDescriptionLabel: UILabel!
    
    override func prepareForReuse() {
        entryImageView.image = nil
        entryNameLabel.text = nil
        entryShortDescriptionLabel.text = nil
    }
    
    func configureView(expoEntry: ExpoEntry) {
        entryImageView.image = UIImage(named: expoEntry.imageName)
        entryNameLabel.text = expoEntry.name
        entryShortDescriptionLabel.text = expoEntry.shortEntryDescription
    }
}
