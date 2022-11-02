//
//  ItemListTableViewCell.swift
//  Expo1900

import UIKit

class ItemListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    lazy var itemCellTextLabels: [UILabel] = [title, subtitle]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemCellTextLabels.forEach { $0.setDynamicType() }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateViews(imageName: String, title: String, subtitle: String) {
        self.itemImage.image = UIImage(named: imageName)
        self.title.text = title
        self.subtitle.text = subtitle
    }
}
