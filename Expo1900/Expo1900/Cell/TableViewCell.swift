//
//  TableViewCell.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/11.
//

import UIKit
final class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: TableViewCell.self)
    @IBOutlet var exhibitItemImage: UIImageView!
    @IBOutlet var exhibitItemName: UILabel!
    @IBOutlet var exhibitItemShortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("@@@@@@@@@@@@@@@@@")
        // Configure the view for the selected state
    }

}
