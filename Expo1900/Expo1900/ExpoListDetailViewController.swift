//
//  ExpoListDetailViewController.swift
//  Expo1900
//
//  Created by TORI on 2021/04/14.
//

import UIKit

class ExpoListDetailViewController: UIViewController {
    
    var imageName: String?
    var descriptionText: String?
    
    let itemImage = UIImageView()
    let itemDescription = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setItemAttribute()
        setItemConstraints()
    }
    
    func setItemAttribute() {
        if let imageName = self.imageName,
           let descriptionText = self.descriptionText {
            itemImage.image = UIImage(named: imageName)
            itemDescription.text = descriptionText
            itemDescription.numberOfLines = 0
            itemDescription.lineBreakMode = .byWordWrapping
        }
    }
    
    func setItemConstraints() {
        view.addSubview(itemImage)
        view.addSubview(itemDescription)
        
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            itemImage.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            itemDescription.topAnchor.constraint(equalTo: itemImage.layoutMarginsGuide.bottomAnchor, constant: 20),
            itemDescription.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            itemDescription.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            itemDescription.centerXAnchor.constraint(equalTo: itemImage.centerXAnchor)
        ])
    }
}
