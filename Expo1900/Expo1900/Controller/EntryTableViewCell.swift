//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryShortDescriptionLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
