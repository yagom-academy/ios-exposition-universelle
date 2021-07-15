//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/07.
//

import UIKit

class HeritageTableViewCell: UITableViewCell {

    @IBOutlet weak private var koreanHeritageImage: UIImageView!
    @IBOutlet weak private var koreanHeritageTitle: UILabel!
    @IBOutlet weak private var koreanHeritageShortDescription: UILabel!
    
    static let identifier = "customCell"
    
    func configure(koreanHeritage: InformationOfKoreanHeritage) {
        koreanHeritageImage.image = UIImage(named: koreanHeritage.imageName)
        koreanHeritageTitle.text = koreanHeritage.name
        koreanHeritageShortDescription.text = koreanHeritage.shortDescription
    }
}
