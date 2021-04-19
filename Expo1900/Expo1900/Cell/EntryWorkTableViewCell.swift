//
//  EntryWorkTableViewCell.swift
//  Expo1900
//
//  Created by 배은서 on 2021/04/10.
//

import UIKit

final class EntryWorkTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var entryWorkImageView: UIImageView!
    @IBOutlet private weak var entryWorkNameLabel: UILabel!
    @IBOutlet private weak var entryWorkShortDescriptionLabel: UILabel!
    
    func updateCell(_ item: EntryWorkItem) {
        entryWorkImageView.image = UIImage(named: item.imageName)
        entryWorkNameLabel.text = item.name
        entryWorkShortDescriptionLabel.text = item.shortDescription
    }
}
