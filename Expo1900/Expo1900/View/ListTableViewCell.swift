//
//  ListTableViewCell.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    var expoDescription: String = ""
    var expoImageName: String = ""
    
    @IBOutlet weak var expoImageView: UIImageView!
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoShortDescriptionLabel: UILabel!
}
