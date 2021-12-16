//
//  TableViewCell2.swift
//  Expo1900
//
//  Created by Hyoju Son on 2021/12/14.
//

import UIKit

class ExpositionItemTableViewCell: UITableViewCell {
    @IBOutlet weak var expositionItemImage: UIImageView?
    @IBOutlet weak var expositionItemNameLabel: UILabel?
    @IBOutlet weak var expositionItemDescriptionLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI() {
        expositionItemNameLabel?.setDynamicType(textStyle: .title1)
        expositionItemNameLabel?.numberOfLines = 0
        expositionItemNameLabel?.lineBreakStrategy = .hangulWordPriority
        
        expositionItemDescriptionLabel?.setDynamicType(textStyle: .body)
        expositionItemDescriptionLabel?.numberOfLines = 0
        expositionItemDescriptionLabel?.lineBreakStrategy = .hangulWordPriority
    }
    
    override func prepareForReuse() {
        expositionItemImage?.image = nil
        expositionItemNameLabel?.text = nil
        expositionItemDescriptionLabel?.text = nil
    }
}
