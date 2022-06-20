//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/16.
//
import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var koreaEntryImage: UIImageView!
    @IBOutlet weak var koreaEntryTitle: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    var detailedDescription: String?
    var cellImage: UIImageView?
}
