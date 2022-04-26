//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/19.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak private var itemImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var shortDescriptionLabel: UILabel!
    @IBOutlet weak private var itemStackView: UIStackView!
    @IBOutlet weak private var labelStackView: UIStackView!
    private lazy var labelLeadingConstraint = labelStackView.leadingAnchor.constraint(equalTo: itemStackView.leadingAnchor, constant: 0.0)
    private lazy var labeltraillingConstraint = labelStackView.trailingAnchor.constraint(equalTo: itemStackView.trailingAnchor, constant: 0.0)
    private lazy var ImageViewWidthConstraint = itemImageView.widthAnchor.constraint(equalTo: itemStackView.widthAnchor, multiplier: 0.6)

    func changeItemStackViewSetting(){
        let category = UIApplication.shared.preferredContentSizeCategory
        
        switch category {
        case UIContentSizeCategory.accessibilityExtraLarge, UIContentSizeCategory.accessibilityExtraExtraLarge, UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            itemStackView.axis = .vertical
            labelLeadingConstraint.isActive = true
            labeltraillingConstraint.isActive = true
            ImageViewWidthConstraint.isActive = true

        default:
            itemStackView.axis = .horizontal
            labelLeadingConstraint.isActive = false
            labeltraillingConstraint.isActive = false
            ImageViewWidthConstraint.isActive = false
        }
    }
    
    func display(with item: Item) {
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.name
        shortDescriptionLabel.text = item.shortDescription
    }
}
