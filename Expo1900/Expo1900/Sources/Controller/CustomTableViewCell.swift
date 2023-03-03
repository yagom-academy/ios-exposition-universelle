//
//  Expo1900 - CustomTableViewCell.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var itemImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        subTitleLabel.text = nil
        itemImageView.image = nil
    }
    
    func configureContent(exhibitItem: ExhibitItem) {
        titleLabel.text = exhibitItem.name
        subTitleLabel.text = exhibitItem.shortDescription
        itemImageView.image = UIImage(named: exhibitItem.imageName)
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        titleLabel.adjustsFontForContentSizeCategory = true
        subTitleLabel.adjustsFontForContentSizeCategory = true
    }
}
