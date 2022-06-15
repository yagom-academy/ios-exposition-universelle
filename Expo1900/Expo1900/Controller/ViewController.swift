//
//  Expo1900 - ViewController.swift
//  Created by Kiwi, Finnn. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "파리 만국박람회"
        return label
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        guard let image = UIImage(named: "poster.png") else { return UIImageView() }
        imageView.image = image
        return imageView
    }()
    
    let audienceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "파리 만국박람회"
        return label
    }()
    
    let venueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "파리 만국박람회"
        return label
    }()
    
    let periodLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "파리 만국박람회"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "파리 만국박람회"
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitleLabel, mainImage, audienceLabel, venueLabel, periodLabel, descriptionLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStackViewConfigure()
        setupLabelConstraints()
    }
    
    func mainStackViewConfigure() {
        view.backgroundColor = .white
        self.view.addSubview(mainStackView)
    }
    
    func setupLabelConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
}

