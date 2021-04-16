//
//  KoreanEntryTableViewCell.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

final class KoreanEntryTableViewCell: UITableViewCell {
    @IBOutlet private weak var itemShortDescLabel: UILabel!
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var itemImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.selectionStyle = .none
    }
    
    func set(_ data: Item) {
        itemTitleLabel.text = data.name
        itemImageView.image = UIImage(named: data.imageName)
        itemShortDescLabel.text = data.shortDesc
        itemTitleLabel.numberOfLines = Int.zero
    }
}
