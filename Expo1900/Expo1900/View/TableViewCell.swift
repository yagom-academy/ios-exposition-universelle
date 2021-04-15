//
//  TableViewCell.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/15.
//

import UIKit

class TableViewCell: UITableViewCell {

    var myImageView: UIImageView!
    var myTitleLabel: UILabel!
    var myShortDescription: UILabel!
    var myStackView: UIStackView!
    var heritageCell: UITableViewCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heritageCell = UITableViewCell()
        myImageView = UIImageView()
        myTitleLabel = UILabel()
        myShortDescription = UILabel()
        
        myImageView.image = UIImage(named: "ywoonggo")
        myTitleLabel.text = ""
        myShortDescription.text = ""
        myStackView = UIStackView()
        
        myStackView.axis = .vertical
        myStackView.alignment = .fill
        myStackView.distribution = .fill
        myStackView.addArrangedSubview(myTitleLabel)
        myStackView.addArrangedSubview(myShortDescription)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        
        heritageCell.addSubview(myImageView)
        heritageCell.addSubview(myStackView)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(myStackView)
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            myImageView.widthAnchor.constraint(equalTo: myImageView.heightAnchor),
            myImageView.trailingAnchor.constraint(equalTo: myStackView.leadingAnchor, constant: 10),
            myImageView.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, multiplier: 1)
        ])
    }
}
