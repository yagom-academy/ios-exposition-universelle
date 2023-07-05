//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryNameLabel: UILabel!
    @IBOutlet private weak var entryShortDescriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
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
