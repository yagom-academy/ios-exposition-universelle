//
//  KoreanItemTableViewCell.swift
//  Expo1900
//
//  Created by LIMGAUI on 2022/04/14.
//

import UIKit

class KoreanItemTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        mainImageView.image = UIImage(named: "poster")
        titleLabel.text = "empty title"
        descriptionLabel.text = "empty description"
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        descriptionLabel.numberOfLines = 0
    }
}
