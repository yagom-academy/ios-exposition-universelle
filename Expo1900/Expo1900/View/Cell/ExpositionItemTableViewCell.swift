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
    
    private let accessoryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .black
        button.sizeToFit()
        button.isUserInteractionEnabled = false
        return button
    }()
    
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
        
        self.accessoryView = accessoryButton
    }
    
    func setAccessibility() {
        guard let imageLabel = expositionItemNameLabel?.text else {
            return
        }
        
        expositionItemImage?.applyAccessibility(with: imageLabel)
        accessoryButton.applyAccessibilityWithImage(label: "상세정보를 보려면 탭하세요") 
        
        guard let image = expositionItemImage,
              let nameLabel = expositionItemNameLabel,
              let descriptionLabel = expositionItemDescriptionLabel
              else {
            return
        }

        self.contentView.accessibilityElements = [image, nameLabel, descriptionLabel, accessoryButton]
    }
    
    override func prepareForReuse() {
        expositionItemImage?.image = nil
        expositionItemNameLabel?.text = nil
        expositionItemDescriptionLabel?.text = nil
    }
}
