//
//  EntitiyDetailViewController.swift
//  Expo1900
//
//  Created by 이정민 on 2022/10/25.
//

import UIKit

class EntityDetailViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let descriptionLabel = InformationLabel(alignment: .natural, settingFont: nil, lines: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setLayout()
    }

    func setImageView(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    func setDescriptionLabel(description: String) {
        descriptionLabel.text = description
    }
    
    private func setLayout() {
        [imageView, descriptionLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
