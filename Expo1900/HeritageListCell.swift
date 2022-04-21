//
//  HeritageListCell.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/15.
//

import UIKit

final class HeritageListCell: UITableViewCell {

    @IBOutlet private weak var heritageImage: UIImageView!
    @IBOutlet private weak var heritageTitleLabel: UILabel!
    @IBOutlet private weak var heritageShortDescriptionLabel: UILabel!
    
    static let identifier = String(describing: HeritageListCell.self)
        
    func setContentOfCell(item: Item) {
        heritageImage.image = UIImage(named: item.imageName)
        heritageTitleLabel.text = item.name
        heritageShortDescriptionLabel.text = item.shortDescription
    }
}
