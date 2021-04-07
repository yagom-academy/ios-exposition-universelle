//
//  KoreaEntryTableViewCell.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

class KoreaEntryTableViewCell: UITableViewCell {
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func setCell(_ cellData: StateEntry) {
        entryImage.image = UIImage(named: cellData.imageName)
        title.text = cellData.name
        descriptionLable.text = cellData.shortDescription
    }
}
