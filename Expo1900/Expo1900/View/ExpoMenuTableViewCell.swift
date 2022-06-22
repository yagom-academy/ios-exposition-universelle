//
//  ExpoMenuTableViewCell.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import UIKit

class ExpoMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var expoItemImageView: UIImageView!
    @IBOutlet weak var expoItemNameLabel: UILabel!
    @IBOutlet weak var expoItemDescriptionLabel: UILabel!
   
    func setupUI(with expoItemElement: ExpoItemElement) {
         setupLableView(name: expoItemElement.name, shortDescription: expoItemElement.shortDesc)
         setupImageView(name: expoItemElement.imageName)
    }
    
    func setupImageView(name: String) {
        self.expoItemImageView.image = UIImage(named: name)
    }
    
    func setupLableView(name: String, shortDescription: String) {
        self.expoItemNameLabel.text = name
        self.expoItemDescriptionLabel.text = shortDescription
    }
}
