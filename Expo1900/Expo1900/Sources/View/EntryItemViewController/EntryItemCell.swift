//
//  EntryItemCell.swift
//  Expo1900
//
//  Created by hyunMac on 11/2/23.
//

import UIKit

final class EntryItemCell: UITableViewCell {
    
    @IBOutlet private weak var entryItemImage: UIImageView!
    @IBOutlet private weak var entryItemTitle: UILabel!
    @IBOutlet private weak var entryItemDescription: UILabel!
    
    func injectData(title: String, description: String, imageName: String) {
        self.entryItemTitle.text = title
        self.entryItemImage.image = UIImage(named: imageName)
        self.entryItemDescription.text = description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
