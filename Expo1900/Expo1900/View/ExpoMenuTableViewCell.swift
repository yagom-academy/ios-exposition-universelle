//
//  ExpoMenuTableViewCell.swift
//  Expo1900
//
//  Created by 변재은 on 2022/06/17.
//

import UIKit

class ExpoMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var ExpoItemImageView: UIImageView!
    @IBOutlet weak var ExpoItemTitleLabel: UILabel!
    @IBOutlet weak var ExpoItemDescriptionLabel: UILabel!
    
    func settingImageView(name: String) {
        self.ExpoItemImageView.image = UIImage(named: name)
    }
    
    func settingLableView(title: String, shortDescription: String) {
        self.ExpoItemTitleLabel.text = title
        self.ExpoItemDescriptionLabel.text = shortDescription
    }
}
