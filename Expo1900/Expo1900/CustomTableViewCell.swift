//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var workName: UILabel!
    @IBOutlet weak var workDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
