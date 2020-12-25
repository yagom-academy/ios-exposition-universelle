//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/22.
//

import Foundation
import UIKit

class ExpositionTableViewCell: UITableViewCell {
    @IBOutlet var koreaItemTitleLabel: UILabel!
    @IBOutlet var koreaItemSubtitleLabel: UILabel!
    @IBOutlet var koreaItemImageView: UIImageView!
    var index: Int?
    
    func setCellData(data: KoreaExpositionItem, index: Int) {
        koreaItemTitleLabel.text = data.name
        koreaItemSubtitleLabel.text = data.shortDescription
        koreaItemImageView.image = data.image
        self.index = index
    }
}

extension ExpositionTableViewCell: DynamicTypeable {
    func setLabelFontStyle() {
        koreaItemTitleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        koreaItemSubtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
}
