//
//  EntryCustomTableViewCell.swift
//  Expo1900
//
//  Created by 서녕 on 2021/12/14.
//

import UIKit

class EntryCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var entryShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
