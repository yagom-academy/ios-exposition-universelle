//
//  MyCustomCell.swift
//  Expo1900
//
//  Created by 유제민 on 2022/10/24.
//

import UIKit

class ExpoEntryCell: UITableViewCell {
    
    func configureContentsView(image: UIImage?, name: String, shortDescription: String) {
        self.imageView?.image = image
        self.textLabel?.text = name
        self.detailTextLabel?.text = shortDescription
    }
}
