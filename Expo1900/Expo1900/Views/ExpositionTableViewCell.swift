//
//  ExpositionTableViewCell.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/24.
//

import UIKit

final class ExpositionTableViewCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var itemSubtitleLabel: UILabel!
    
    func configure(imageName: String?, title: String?, subtitle: String?) {
        guard let imageName = imageName else { return }
        
        itemImageView.image = UIImage(named: imageName)
        itemTitleLabel.text = title
        itemSubtitleLabel.text = subtitle
    }
}

