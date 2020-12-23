//
//  ExhibitionWorkTableViewCell.swift
//  Expo1900
//
//  Created by 강인희 on 2020/12/23.
//

import UIKit

class ExhibitionWorkTableViewCell: UITableViewCell {
    @IBOutlet weak var workImage: UIImageView!
    @IBOutlet weak var workName: UILabel!
    @IBOutlet weak var workShortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
