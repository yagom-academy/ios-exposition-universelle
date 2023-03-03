//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/27.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet var contents: [Any]!
    
    private var item: Item?
    
    func setContents() {
        guard let item = self.item else { return }
        let itemName = item.name
        let shortDescription = item.shortDescription
        let itemImage = UIImage(named: item.imageName)
        
        self.itemNameLabel.text = itemName
        self.shortDescriptionLabel.text = shortDescription
        self.itemImageView.image = itemImage
        self.accessoryType = .disclosureIndicator
    }
    
    func allocate(data: Item) {
        self.item = data
    }

}

extension CustomTableViewCell {
    func setAccessibilityProperties() {
        self.isAccessibilityElement = false
        self.accessibilityElements = []
        self.contents.forEach { self.accessibilityElements?.append($0) }
        
        setLabelAccessibility()
        setImageViewAccessibility()
    }
    
    private func setLabelAccessibility() {
        self.itemNameLabel.accessibilityLabel = item?.name
        self.shortDescriptionLabel.accessibilityLabel = "짧은 설명"
        self.shortDescriptionLabel.accessibilityValue = item?.shortDescription
    }
    
    private func setImageViewAccessibility() {
        self.itemImageView.isAccessibilityElement = true
        self.itemImageView.accessibilityLabel = item?.name
        self.itemImageView.accessibilityTraits = .image
        self.itemImageView.accessibilityHint = "현재 셀을 선택하면 상세 화면으로 이동합니다."
    }
}
