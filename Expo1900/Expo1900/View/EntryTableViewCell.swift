//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by Jae-hoon Sim on 2021/07/08.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
