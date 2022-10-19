//
//  ItemTableViewCell.swift
//  Expo1900

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var itemDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemDescription.setTextView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITextView {
    func setTextView() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.isScrollEnabled = false
        self.sizeToFit()
    }
}
