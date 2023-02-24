//
//  ExpositionTableViewCell.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/24.
//

import UIKit

final class ExpositionTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemSubtitleLabel: UILabel!
}

extension ExpositionTableViewCell: ReuseIdentifying { }
