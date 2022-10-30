//  KoreanEntryTableViewCell.swift
//  Created by Mangdi, zhilly on 2022/10/26

import UIKit

class KoreanEntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryShortDescription: UILabel!

    let cellIdentifier: String = "koreanEntryCell"
    
    func configureCell(imageName: String, entryName: String, description: String) {
        entryImage.image = UIImage(named: imageName)
        entryTitleLabel.text = entryName
        entryShortDescription.text = description
    }
}
