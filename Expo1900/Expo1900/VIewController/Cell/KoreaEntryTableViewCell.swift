//
//  KoreaEntryTableViewCell.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

class KoreaEntryTableViewCell: UITableViewCell {
    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!
    
    func setCell(_ cellData: StateEntry) {
        entryImage.image = UIImage(named: cellData.imageName)
        title.text = cellData.name
        descriptionLable.text = cellData.shortDescription
        descriptionLable.lineBreakStrategy = .hangulWordPriority
    }
}
