//
//  HeritageListCell.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/15.
//

import UIKit

final class HeritageListCell: UITableViewCell, ViewControllerIdentifier {

    @IBOutlet private weak var heritageImage: UIImageView!
    @IBOutlet private weak var heritageTitleLabel: UILabel!
    @IBOutlet private weak var heritageShortDescriptionLabel: UILabel!
    
    func setContentOfCell(item: Item) {
        heritageImage.image = UIImage(named: item.imageName)
        heritageTitleLabel.text = item.name
        heritageShortDescriptionLabel.text = item.shortDescription
    }
}
