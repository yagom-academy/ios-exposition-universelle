//  ExhibitTableViewCell.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/21.

import UIKit

class ExhibitTableViewCell: UITableViewCell {
    @IBOutlet private weak var exhibitImageView: UIImageView!
    @IBOutlet private weak var exhibitNameLabel: UILabel!
    @IBOutlet private weak var exhibitShortDescriptionLabel: UILabel!
    
    func configureCell(with exhibit: ExhibitData) {
        self.exhibitImageView.image = exhibit.image
        self.exhibitNameLabel.text = exhibit.name
        self.exhibitNameLabel.font = ExpositionConstant.exhibitCellTitleFont
        self.exhibitShortDescriptionLabel.text = exhibit.shortDescription
    }
}
