//
//  KoreanArtWorkTableViewCell.swift
//  Expo1900
//
//  Created by JeongTaek Han on 2021/12/13.
//

import UIKit

class KoreanArtWorkTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var imageViewLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
