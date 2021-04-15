//
//  TableViewCell.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/11.
//

import UIKit
final class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: TableViewCell.self)
    @IBOutlet var exhibitItemImage: UIImageView!
    @IBOutlet var exhibitItemName: UILabel!
    @IBOutlet var exhibitItemShortDescription: UILabel!
    
    func setUpDataOfCell(exhibitItem: ExhibitItem){
        self.exhibitItemImage.image = UIImage(named: exhibitItem.imageName)
        self.exhibitItemName.text = exhibitItem.name
        self.exhibitItemShortDescription.text = exhibitItem.shortDescriptions
        self.exhibitItemShortDescription.numberOfLines = 0
    }

}
