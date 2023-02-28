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
    
    func configure(item: ExpositionUniverselleItem) {
        itemImageView.image = UIImage(named: item.imageName)
        itemTitleLabel.text = item.name
        itemSubtitleLabel.text = item.shortDescription
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemImageView.image = nil
        itemTitleLabel.text = nil
        itemSubtitleLabel.text = nil
    }
}
