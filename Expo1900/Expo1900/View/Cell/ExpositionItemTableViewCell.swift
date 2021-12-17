//
//  TableViewCell2.swift
//  Expo1900
//
//  Created by Hyoju Son on 2021/12/14.
//

import UIKit

class ExpositionItemTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var expositionItemImage: UIImageView?
    @IBOutlet private weak var expositionItemNameLabel: UILabel?
    @IBOutlet private weak var expositionItemDescriptionLabel: UILabel?
    
    // MARK: - Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setAccessibility()
    }
    
    override func prepareForReuse() {
        expositionItemImage?.image = nil
        expositionItemNameLabel?.text = nil
        expositionItemDescriptionLabel?.text = nil
    }
    
    // MARK: - Methods
    private func setupUI() {
        expositionItemNameLabel?.numberOfLines = 0
        expositionItemNameLabel?.lineBreakStrategy = .hangulWordPriority
                
        expositionItemDescriptionLabel?.numberOfLines = 0
        expositionItemDescriptionLabel?.lineBreakStrategy = .hangulWordPriority
    }
    
    func configureCell(with data: ExpositionItem) {
        expositionItemImage?.image = UIImage(named: data.imageName)
        expositionItemNameLabel?.text = data.name
        expositionItemDescriptionLabel?.text = data.shortDescription
    }
    
    // MARK: - Accessibility
    private func setAccessibility() {
        expositionItemNameLabel?.setDynamicType(textStyle: .title1)
        expositionItemDescriptionLabel?.setDynamicType(textStyle: .body)
    }
}
