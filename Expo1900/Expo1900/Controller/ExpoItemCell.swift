//
//  ExpoItemCell.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/11/01.
//

import UIKit

final class ExpoItemCell: UITableViewCell {

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    
    func configureCell(asset: ExhibitionItem) {
        itemImageView.image = UIImage(named: asset.imageName)
        itemNameLabel.text = asset.name
        itemDescriptionLabel.text = asset.shortDescription
    }

}
