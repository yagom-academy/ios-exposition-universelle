//
//  ExpoItemCell.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/11/01.
//

import UIKit

final class ExpoItemCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    func configureCell(asset: ExhibitionItem) {
        itemImageView.image = UIImage(named: asset.imageName)
        itemNameLabel.text = asset.name
        itemDescriptionLabel.text = asset.shortDescription
    }

}
