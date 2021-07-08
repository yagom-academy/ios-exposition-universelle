//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var koreanHeritageImage: UIImageView!
    @IBOutlet weak var koreanHeritageTitle: UILabel!
    @IBOutlet weak var koreanHeritageShortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
