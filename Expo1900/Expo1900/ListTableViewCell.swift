//  Expo1900 - ListCellTableViewCell.swift
//  created by goat, vetto on 2023/02/22

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var expositionImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
