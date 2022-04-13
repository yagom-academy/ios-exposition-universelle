//
//  ExpoItemTableViewCell.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/13.
//

import UIKit

final class ExpoItemTableViewCell: UITableViewCell {
  
  static let identifier = String(describing: ExpoItemTableViewCell.self)
  
  @IBOutlet weak var expoItemImageView: UIImageView!
  @IBOutlet weak var expoItemTitleLabel: UILabel!
  @IBOutlet weak var expoItemDescriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
