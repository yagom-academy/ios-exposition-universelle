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
    
    func fillCells(data: Entry) {
        guard let image = data.imageName,
              let name = data.name,
              let shortDescription = data.shortDescription else {
            return
        }
        
        self.nameImage.image = UIImage(named: image)
        self.nameLabel.text = name
        self.shortDescriptionLabel.text = shortDescription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
