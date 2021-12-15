//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 임지성 on 2021/12/09.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setModel(_ model: ExpositionItem) {
        configure(item: model)
    }
    
    private func configure(item: ExpositionItem) {
        itemImageView.image = UIImage(named: item.imageName)
        itemNameLabel.text = item.name
        itemShortDescriptionLabel.text = item.shortDescription
        itemImageView.accessibilityLabel = item.name
    }
}
