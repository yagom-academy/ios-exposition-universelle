//
//  DetailTableViewCell.swift
//  Expo1900
//
//  Created by 맹선아 on 2022/10/24.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var entryimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!

    func buildCell(from entry: Entry) {
        entryimageView.image = UIImage(named: entry.imageName)
        titleLabel.text = entry.name
        descriptLabel.text = entry.shortDescription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .title1)
    }
}
