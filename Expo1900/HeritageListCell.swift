//
//  HeritageListCell.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/15.
//

import UIKit

class HeritageListCell: UITableViewCell {

    @IBOutlet private weak var heritageImage: UIImageView!
    @IBOutlet private weak var heritageTitleLabel: UILabel!
    @IBOutlet private weak var heritageShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContentOfCell(_ item: Item) {
        self.heritageImage.image = UIImage(named: item.imageName)
        self.heritageTitleLabel.text = item.name
        self.heritageShortDescriptionLabel.text = item.shortDescription
    }
}
