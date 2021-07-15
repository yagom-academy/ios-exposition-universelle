//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach. on 2021/07/13.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    static let registerID: String = "\(EntryTableViewCell.self)"
    
    // MARK: @IBOutlets
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
