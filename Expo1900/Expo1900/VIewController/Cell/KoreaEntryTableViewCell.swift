//
//  KoreaEntryTableViewCell.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

class KoreaEntryTableViewCell: UITableViewCell {
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!
    
    func setCell(_ cellData: StateEntry) {
        entryImageView.image = UIImage(named: cellData.imageName)
        titleLabel.text = cellData.name
        descriptionLable.text = cellData.shortDescription
        descriptionLable.lineBreakStrategy = .hangulWordPriority
    }
}
