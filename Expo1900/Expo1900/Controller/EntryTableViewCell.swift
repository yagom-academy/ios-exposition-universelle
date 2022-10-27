//
//  EntryTableViewCell.swift
//  Created by sunnyCookie, Wonbi
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var entryimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureAttribute()
    }
}

extension EntryTableViewCell {
    func buildCell(from entry: Entry) {
        entryimageView.image = UIImage(named: entry.imageName)
        titleLabel.text = entry.name
        descriptLabel.text = entry.shortDescription
    }
    
    private func configureAttribute() {
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        
        descriptLabel.adjustsFontForContentSizeCategory = true
        descriptLabel.font = .preferredFont(forTextStyle: .subheadline)
        descriptLabel.numberOfLines = 0
    }
}
