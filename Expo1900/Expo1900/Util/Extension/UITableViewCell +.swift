//
//  UITableViewCell +.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/29.
//

import UIKit

extension UITableViewCell {
    func setExpositionEntryCell(information: ExhibitionItem) {
        var content = defaultContentConfiguration()
        
        content.text = information.name
        content.secondaryText = information.shortDescription
        content.image = UIImage(named: information.imageName)
        content.imageProperties.maximumSize.width = 70
        content.imageProperties.maximumSize.height = 70
        
        contentConfiguration = content
        accessoryType = .disclosureIndicator
    }
}
