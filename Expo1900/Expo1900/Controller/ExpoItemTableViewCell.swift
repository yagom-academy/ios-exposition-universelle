//
//  ExpoItemTableViewCell.swift
//  Expo1900
//
//  Created by Jun Bang on 2021/12/10.
//

import UIKit

class ExpoItemTableViewCell: UITableViewCell {
    @IBOutlet weak var expoItemImageView: UIImageView!
    @IBOutlet weak var expoItemNameLabel: UILabel!
    @IBOutlet weak var expoItemExplanationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    
    private func setUpCell() {
        expoItemNameLabel.font = UIFont.systemFont(ofSize: 25)
    }
    
    func configure(with expoItem: ExpoItem) {
        expoItemImageView.image = UIImage(named: expoItem.imageName)
        expoItemNameLabel.text = expoItem.name
        expoItemExplanationLabel.text = expoItem.summary
    }
}
