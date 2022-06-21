//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/16.
//
import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var koreaEntryImage: UIImageView!
    @IBOutlet private(set) weak var koreaEntryTitle: UILabel!
    @IBOutlet private(set) weak var shortDescription: UILabel!
    var detailedDescription: String?
    var cellImage: UIImageView?
    
    func sendData(to viewController: DescriptionViewController) {
        viewController.detailedDescriptionText = self.detailedDescription
        viewController.entryImage = self.koreaEntryImage
    }
}
