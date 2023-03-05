//
//  extension+UITableViewCell.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/22.
//

import UIKit

extension UITableViewCell {
    
    static let reuseIdentifier = "cell"
    
    func setCellContents(_ indexPath: IndexPath) {
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        guard let item = ExhibitItem.items?[indexPath.row],
              let image = UIImage(named: item.imageName) else { return }

        var content = self.defaultContentConfiguration()
        
        content.text = item.name
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .title2)
        content.secondaryText = item.shortDescription
        content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .body)
        content.image = image
        
        content.imageProperties.maximumSize.height = image.resizeHeightByWidth(width: 60)
        content.imageProperties.maximumSize.width = 60
        
        self.contentConfiguration = content
        self.accessoryType = .disclosureIndicator
    }
}
