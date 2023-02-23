//
//  Extention+UITableViewCell.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/22.
//

import UIKit

extension UITableViewCell {
    static let reuseIdentifier = "cell"
    
    func setCellContents(_ indexPath: IndexPath) {
        guard let item = ExhibitItem.items?[indexPath.row] else { return }
//        let image = UIImage(named: item.imageName)
        
        var content = self.defaultContentConfiguration()
        
        content.text = item.name
        content.textProperties.font = UIFont.systemFont(ofSize: 26) // 폰트 사이즈
        content.secondaryText = item.shortDescription
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
        content.image = UIImage(named: item.imageName)
        content.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        
        self.contentConfiguration = content
        
        /* 셀 자체 커스텀은 cell에서 직접 접근 */
//        self.accessoryType = .detailDisclosureButton
//        self.backgroundColor = .brown
    }
}
