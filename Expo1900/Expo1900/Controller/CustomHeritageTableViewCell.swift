//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/07.
//

import UIKit

class CustomHeritageTableViewCell: UITableViewCell {

    @IBOutlet weak private var koreanHeritageImage: UIImageView!
    @IBOutlet weak private var koreanHeritageTitle: UILabel!
    @IBOutlet weak private var koreanHeritageShortDescription: UILabel!
    
    func configure(title: String, shortDescription: String, imageName: String) {
        koreanHeritageImage.image = UIImage(named: imageName)
        koreanHeritageTitle.text = title
        koreanHeritageShortDescription.text = shortDescription
    }
}
