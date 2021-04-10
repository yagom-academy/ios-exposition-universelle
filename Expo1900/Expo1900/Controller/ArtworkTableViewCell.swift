//
//  ArtworkTableViewCell.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/10.
//

import UIKit

class ArtworkTableViewCell: UITableViewCell {
  
  @IBOutlet weak var artworkImageView: UIImageView!
  @IBOutlet weak var artworkTitleLabel: UILabel!
  @IBOutlet weak var artworkShortDescriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
