//
//  ExhibitionItemsTableViewCell.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

final class ExhibitionItemsTableViewCell: UITableViewCell {
    @IBOutlet weak private var itemImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!
    
    func setUpCell(by exhibitionItem: ExhibitionItem) {
        self.itemImageView.image = UIImage(named: exhibitionItem.imageName ?? "")
        self.titleLabel.text = exhibitionItem.name
        self.subtitleLabel.text = exhibitionItem.shortDescription
    }
}
