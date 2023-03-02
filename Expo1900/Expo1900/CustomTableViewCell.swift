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
    
    func setAccessibilityProperties(itemName: String, shortDescription: String) {
        self.itemNameLabel.accessibilityLabel = itemName
        
        self.shortDescriptionLabel.accessibilityLabel = "짧은 설명"
        self.shortDescriptionLabel.accessibilityValue = shortDescription
        
        self.itemImageView.isAccessibilityElement = true
        self.itemImageView.accessibilityLabel = itemName
        self.itemImageView.accessibilityTraits = .image
        self.itemImageView.accessibilityHint = "현재 셀을 선택하면 상세 화면으로 이동합니다."
        
        self.isAccessibilityElement = false
        self.accessibilityElements = [
            self.itemNameLabel!,
            self.shortDescriptionLabel!,
            self.itemImageView!
        ]
    }
}
