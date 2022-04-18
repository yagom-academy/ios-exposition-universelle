//
//  EntryCell.swift
//  Expo1900
//
//  Created by 고명주 on 2022/04/18.
//

import UIKit

enum EntryCellLetter {
    static let emptyImage = ""
}

final class EntryCell: UITableViewCell {
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemTitle: UILabel!
    @IBOutlet private weak var itemShortDiscription: UILabel!
    
    func configure(item: ExpositionItems?) {
        itemImage.image = UIImage(named: item?.imageName ?? EntryCellLetter.emptyImage)
        itemTitle.text = item?.name
        itemShortDiscription.text = item?.shortDescription
    }
}

