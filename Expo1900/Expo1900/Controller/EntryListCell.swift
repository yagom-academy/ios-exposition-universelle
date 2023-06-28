//
//  EntryListCell.swift
//  Expo1900
//
//  Created by 김민성 on 2023/06/28.
//

import UIKit

class EntryListCell: UITableViewCell {
    @IBOutlet weak private var entryImage: UIImageView!
    @IBOutlet weak private var entryTitleLabel: UILabel!
    @IBOutlet weak private var entryShortDescriptionLabel: UILabel!
    
    static let nibName = "EntryListCell"
    static let reuseIdentifier = "entryListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(entry: Entry) {
        self.entryImage.image = UIImage(named: entry.imageName)
        self.entryTitleLabel.text = entry.name
        self.entryShortDescriptionLabel.text = entry.shortDescription
    }
}
