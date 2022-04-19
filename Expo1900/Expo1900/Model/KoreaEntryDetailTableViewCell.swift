//
//  KoreaEntryDetailTableViewCell.swift
//  Expo1900
//
//  Created by Eddy on 2022/04/14.
//

import UIKit

final class KoreaEntryDetailTableViewCell: UITableViewCell {
    @IBOutlet private weak var shortDescriptionLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var koreaEntryImageView: UIImageView!
    
    func makeCell(koreaEntryData: KoreaEntryDetail) {
        koreaEntryImageView.image = UIImage(named: koreaEntryData.imageFileName)
        titleLabel.text = koreaEntryData.name
        shortDescriptionLabel.text = koreaEntryData.shortDescription
        shortDescriptionLabel.numberOfLines = 0
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
}
