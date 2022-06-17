//
//  ExpoMenuTableViewCell.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import UIKit

class ExpoMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var ExpoItemImageView: UIImageView!
    @IBOutlet weak var ExpoItemNameLabel: UILabel!
    @IBOutlet weak var ExpoItemDescriptionLabel: UILabel!
    
    func settingImageView(name: String) {
        self.ExpoItemImageView.image = UIImage(named: name)
    }
    
    func settingLableView(name: String, shortDescription: String) {
        self.ExpoItemNameLabel.text = name
        self.ExpoItemDescriptionLabel.text = shortDescription
    }
}
