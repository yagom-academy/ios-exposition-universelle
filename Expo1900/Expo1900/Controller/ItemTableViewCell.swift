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
    @IBOutlet weak var itemStackView: UIStackView!
    @IBOutlet weak var labelStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func changeItemStackViewSetting(){
        let category = UIApplication.shared.preferredContentSizeCategory
        
        switch category {
        case UIContentSizeCategory.accessibilityExtraLarge, UIContentSizeCategory.accessibilityExtraExtraLarge, UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            itemStackView.axis = .vertical
            labelStackView.leadingAnchor.constraint(equalTo: itemStackView.leadingAnchor, constant: 0.0).isActive = true
            labelStackView.trailingAnchor.constraint(equalTo: itemStackView.trailingAnchor, constant: 0.0).isActive = true

        default:
            itemStackView.axis = .horizontal
        }
    }
    
    func displayWith(item: Item) {
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.name
        shortDescriptionLabel.text = item.shortDescription
    }
}
