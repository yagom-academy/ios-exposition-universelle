//
//  EntryTableViewCell.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/19.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryLabel: UILabel!
    @IBOutlet weak var entrySubLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
