//  KoreanEntryTableViewCell.swift
//  Created by Mangdi, zhilly on 2022/10/26

import UIKit

class KoreanEntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryShortDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
