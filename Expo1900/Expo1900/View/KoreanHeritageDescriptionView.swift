//
//  KoreanHeritageView.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/16.
//

import UIKit

class KoreanHeritageDescriptionView: UIView {
    
    var heritageItem: HeritageItem!
    var heritageScrollView: UIScrollView!
    var heritageImageView: UIImageView!
    var heritageDescription: UILabel!
    var heritageStackView: UIStackView!
    
    func 초기화해주기() {
        heritageImageView.image = UIImage(named: heritageItem.imageName)
        heritageDescription.text = heritageItem.description
    }
    
    override func awakeFromNib() {
        heritageScrollView = UIScrollView()
        heritageStackView = UIStackView()
        heritageImageView = UIImageView()
        heritageDescription = UILabel()
        
        
        heritageImageView.contentMode = .scaleAspectFit
        self.addSubview(heritageScrollView)
        
        heritageScrollView.addSubview(heritageStackView)
        heritageStackView.addArrangedSubview(heritageImageView)
        heritageStackView.addArrangedSubview(heritageDescription)
        heritageStackView.axis = .vertical
        heritageStackView.alignment = .fill
        heritageStackView.distribution = .fill
        heritageStackView.spacing = 10
        heritageDescription.numberOfLines = 0
        
        heritageScrollView.translatesAutoresizingMaskIntoConstraints = false
        heritageImageView.translatesAutoresizingMaskIntoConstraints = false
        heritageStackView.translatesAutoresizingMaskIntoConstraints = false
        heritageDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heritageScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            heritageScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            heritageScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            heritageScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            heritageStackView.topAnchor.constraint(equalTo: heritageScrollView.topAnchor),
            heritageStackView.bottomAnchor.constraint(equalTo: heritageScrollView.bottomAnchor),
            heritageStackView.leadingAnchor.constraint(equalTo: heritageScrollView.leadingAnchor),
            heritageStackView.trailingAnchor.constraint(equalTo: heritageScrollView.trailingAnchor),
            heritageStackView.widthAnchor.constraint(equalTo: heritageScrollView.widthAnchor),
            
            heritageImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            heritageImageView.topAnchor.constraint(equalTo: heritageStackView.topAnchor, constant: 10),
            heritageImageView.widthAnchor.constraint(equalTo: heritageStackView.widthAnchor, multiplier: 0.8),
            heritageImageView.heightAnchor.constraint(lessThanOrEqualTo: heritageStackView.widthAnchor, multiplier: 0.8),
            heritageDescription.widthAnchor.constraint(equalTo: heritageStackView.widthAnchor, multiplier: 0.9),
            heritageDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
