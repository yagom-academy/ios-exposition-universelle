//
//  ExpoEntry.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit

class ExpoEntryCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellDetailText: UILabel!
    
    func configureContentsView(image: UIImage?, name: String, shortDescription: String) {
        self.cellImage?.image = image
        self.cellText?.text = name
        self.cellDetailText?.text = shortDescription
    }
}
