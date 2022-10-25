//  File.swift
//  Expo1900
//
//  Created by Ayaan, Bella on 2022/10/25.

import UIKit

extension UITableViewCell {
    func configure(for item: ExpositionUniverselleItem) {
        self.imageView?.image = UIImage(named: item.imageName)
        self.textLabel?.text = item.name
        self.detailTextLabel?.text = item.shortDescription
        self.detailTextLabel?.numberOfLines = 0
        self.accessoryType = .disclosureIndicator
    }
}

