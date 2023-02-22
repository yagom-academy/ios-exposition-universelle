//
//  ExhibitItemCell.swift
//  Expo1900
//
//  Created by 김성준 on 2023/02/22.
//

import UIKit

class ExhibitItemCell: UITableViewCell {
    static let reuseIdentifier = "ExhibitItemCell"
    private let stackView = UIStackView()
    private let itemImageView = UIImageView()
    private let subStackView = UIStackView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
   
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

        setStackView()
        
        itemImageView.center = self.center
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        subStackView.axis = .vertical
        subStackView.distribution = .fill
        subStackView.alignment = .fill
        
        titleLabel.font = .systemFont(ofSize: 18)
        subTitleLabel.font = .systemFont(ofSize: 13)
        
        subStackView.addArrangedSubview(titleLabel)
        subStackView.addArrangedSubview(subTitleLabel)
        
        stackView.addArrangedSubview(itemImageView)
        stackView.addArrangedSubview(subStackView)
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProperty(imageName: String?, title: String?, subTitle: String?) {
        let image = UIImage(named: imageName!)
        
        itemImageView.image = image
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    func setStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
    }
    
    

}
