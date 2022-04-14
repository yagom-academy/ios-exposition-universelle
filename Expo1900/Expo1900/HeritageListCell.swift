//
//  HeritageListCell.swift
//  Expo1900
//
//  Created by marisol on 2022/04/15.
//

import UIKit

class HeritageListCell: UITableViewCell {

    @IBOutlet weak var heritageImage: UIImageView!
    @IBOutlet weak var heritageTitleLabel: UILabel!
    @IBOutlet weak var heritageShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
