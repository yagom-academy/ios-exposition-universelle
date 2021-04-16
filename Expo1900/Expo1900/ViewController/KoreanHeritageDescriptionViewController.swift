//
//  KoreanHeritageDescriptionViewController.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/16.
//

import UIKit

class KoreanHeritageDescriptionViewController: UIViewController {

    var heritageItem: HeritageItem!
    var heritageScrollView: UIScrollView!
    var heritageImageView: UIImageView!
    var heritageDescription: UILabel!
    var heritageStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heritageScrollView = UIScrollView()
        heritageStackView = UIStackView()
        heritageImageView = UIImageView()
        heritageDescription = UILabel()
        
        heritageImageView.image = UIImage(named: heritageItem.imageName)
        navigationItem.title = heritageItem.name
        heritageDescription.text = heritageItem.description
        
        view.addSubview(heritageScrollView)
        
        heritageScrollView.addSubview(heritageStackView)
        heritageStackView.addArrangedSubview(heritageImageView)
        heritageStackView.addArrangedSubview(heritageDescription)
        heritageStackView.axis = .vertical
        heritageStackView.alignment = .fill
        heritageStackView.distribution = .fill
        heritageDescription.numberOfLines = 0
        
        heritageScrollView.translatesAutoresizingMaskIntoConstraints = false
        heritageImageView.translatesAutoresizingMaskIntoConstraints = false
        heritageStackView.translatesAutoresizingMaskIntoConstraints = false
        heritageDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heritageScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            heritageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            heritageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            heritageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            heritageStackView.topAnchor.constraint(equalTo: heritageScrollView.topAnchor),
            heritageStackView.bottomAnchor.constraint(equalTo: heritageScrollView.bottomAnchor),
            heritageStackView.leadingAnchor.constraint(equalTo: heritageScrollView.leadingAnchor),
            heritageStackView.trailingAnchor.constraint(equalTo: heritageScrollView.trailingAnchor),
            heritageStackView.widthAnchor.constraint(equalTo: heritageScrollView.widthAnchor),
            
            heritageImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heritageImageView.widthAnchor.constraint(equalTo: heritageStackView.widthAnchor, multiplier: 0.5),
            heritageImageView.widthAnchor.constraint(equalTo: heritageImageView.heightAnchor),
            heritageImageView.bottomAnchor.constraint(equalTo: heritageDescription.topAnchor),
            heritageDescription.widthAnchor.constraint(equalTo: heritageStackView.widthAnchor, multiplier: 0.9),
            heritageDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
