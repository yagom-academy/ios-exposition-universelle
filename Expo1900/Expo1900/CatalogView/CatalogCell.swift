//
//  ListCell.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import UIKit

// MARK: custom cell
class CatalogCell: UITableViewCell {
  @IBOutlet var imgView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var shortDescriptionLabel: UILabel!
  
  func update(info: ExhibitionWorkCell) {
    imgView.image = info.image
    nameLabel.text = info.name
    shortDescriptionLabel.text = info.shortDescription
  }
}
