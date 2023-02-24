//
//  ListTableViewCell.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    private(set) var expoDescription: String = ""
    private(set) var expoImageName: String = ""
    
    @IBOutlet weak private(set) var expoImageView: UIImageView!
    @IBOutlet weak private(set) var expoTitleLabel: UILabel!
    @IBOutlet weak private(set) var expoShortDescriptionLabel: UILabel!
    
    func configureCellData(expoItem: ExpoItem) {
        expoTitleLabel.text = expoItem.name
        expoShortDescriptionLabel.text = expoItem.shortDescription
        expoShortDescriptionLabel.numberOfLines = 0
        expoImageView.image = UIImage(named: expoItem.imageName)
        expoDescription = expoItem.description
        expoImageName = expoItem.imageName
    }
}
