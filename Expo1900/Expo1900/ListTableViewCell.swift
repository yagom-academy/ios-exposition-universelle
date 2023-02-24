//  Expo1900 - ListCellTableViewCell.swift
//  created by goat, vetto on 2023/02/22

import UIKit

final class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var expositionImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
