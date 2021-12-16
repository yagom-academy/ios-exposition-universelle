//
//  ExpoItemTableViewCell.swift
//  Expo1900
//
//  Created by Aladdin on 2021/12/10.
//

import UIKit

final class ExpoItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var expoItemImageView: UIImageView!
    @IBOutlet weak var expoItemNameLabel: UILabel!
    @IBOutlet weak var expoItemExplanationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    
    private func setUpCell() {
        expoItemNameLabel.applyDynamicType(fontStyle: .title1)
        expoItemExplanationLabel.applyDynamicType(fontStyle: .title2)
    }
    
    func configure(with expoItem: ExpoItem) {
        expoItemImageView.image = UIImage(named: expoItem.imageName)
        expoItemNameLabel.text = expoItem.name
        expoItemExplanationLabel.text = expoItem.summary
    }
}
