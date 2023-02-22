//
//  ExhibitItemCell.swift
//  Expo1900
//
//  Created by 김성준 on 2023/02/22.
//

import UIKit

class ExhibitItemCell: UITableViewCell {
    private let stackView = UIStackView()
    static let reuseIdentifier = "ExhibitItemCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            //stackView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        setStackView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProperty(imageName: String?, title: String?, subTitle: String?) {
        let imageView = UIImageView()
        imageView.center = self.center
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: imageName!)
        imageView.image = image
        
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let subStackView = UIStackView()
        subStackView.axis = .vertical
        subStackView.distribution = .fill
        subStackView.alignment = .fill
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 18)
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitle
        subTitleLabel.font = .systemFont(ofSize: 13)
        
        subStackView.addArrangedSubview(titleLabel)
        subStackView.addArrangedSubview(subTitleLabel)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(subStackView)
    }
    
    func setStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
    }
    
    

}
