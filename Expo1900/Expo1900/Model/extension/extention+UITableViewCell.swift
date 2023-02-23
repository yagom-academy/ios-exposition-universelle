//
//  extention+UITableViewCell.swift
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
              let image = UIImage(named: item.imageName)?.squareImage() else { return }

        var content = self.defaultContentConfiguration()

        content.text = item.name
        content.textProperties.font = UIFont.systemFont(ofSize: 22) // 폰트 사이즈
        content.secondaryText = item.shortDescription
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
        content.image = image
        content.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        
        self.contentConfiguration = content
        self.accessoryType = .disclosureIndicator
    }
    

    
}
