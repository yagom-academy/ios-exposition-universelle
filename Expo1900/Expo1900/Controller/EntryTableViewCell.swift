//
//  TableViewCell.swift
//  Expo1900
//
//  Created by minsong kim on 2023/06/28.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var nameImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    func insertCellData(from data: Entry) {
        
        self.nameImage.image = UIImage(named: data.imageName)
        self.nameLabel.text = data.name
        self.shortDescriptionLabel.text = data.shortDescription
    }
}
