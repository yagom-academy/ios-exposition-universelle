//
//  HeritageCell.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/15.
//

import UIKit

class HeritageCell: UITableViewCell {

    var myImageView: UIImageView! 
    var myTitleLabel: UILabel!
    var myShortDescription: UILabel!
    var myStackView: UIStackView!
    var myRightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView = UIImageView()
        myTitleLabel = UILabel()
        myShortDescription = UILabel()
        myRightImageView = UIImageView()
        myStackView = UIStackView()
        
        myImageView.image = UIImage(named: "ywoonggo")
        myImageView.contentMode = .scaleAspectFit
        myTitleLabel.text = "삼각함수"
        myTitleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        myShortDescription.text = """
        정의를 정확하게 아는것이 중요하지정의를 정확하게 아는것이 중요하지
        정의를 정확하게 아는것이 중요하지
        정의를 정확하게 아는것이 중요하지
        정의를 정확하게 아는것이 중요하지
        """
        myShortDescription.numberOfLines = 0
        myStackView.axis = .vertical
        myStackView.alignment = .fill
        myStackView.distribution = .equalCentering
        myStackView.addArrangedSubview(myTitleLabel)
        myStackView.addArrangedSubview(myShortDescription)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myRightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(myImageView)
        contentView.addSubview(myStackView)
        contentView.addSubview(myRightImageView)
        
        NSLayoutConstraint.activate([
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            myImageView.widthAnchor.constraint(equalTo: myImageView.heightAnchor),
            myImageView.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, multiplier: 1),
            myImageView.trailingAnchor.constraint(equalTo: myStackView.leadingAnchor, constant: -10),
            
            myStackView.trailingAnchor.constraint(lessThanOrEqualTo: myRightImageView.leadingAnchor),
            myStackView.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor),
            myStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myRightImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myRightImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.05),
            myRightImageView.widthAnchor.constraint(equalTo: myRightImageView.heightAnchor),
            myRightImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
}
