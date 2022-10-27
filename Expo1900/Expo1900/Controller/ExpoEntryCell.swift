//
//  ExpoEntry.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit

class ExpoEntryCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellDetailText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellImage.widthAnchor.constraint(equalTo: cellImage.heightAnchor),
            cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0),
            cellImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 8.0),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    func configureContentsView(image: UIImage?, name: String, shortDescription: String) {
        self.cellImage?.image = image
        self.cellText?.text = name
        self.cellDetailText?.text = shortDescription
    }
}
