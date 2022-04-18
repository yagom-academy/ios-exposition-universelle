//
//  KoreanItemTableViewCell.swift
//  Expo1900
//
//  Created by LIMGAUI on 2022/04/14.
//

import UIKit

class KoreanItemTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func assignValue(from item: KoreanHistoricalItem) {
        titleLabel.text = item.name
        descriptionLabel.text = item.shortDesciption
        mainImageView.image = UIImage(named: item.imageName)
    }
}
