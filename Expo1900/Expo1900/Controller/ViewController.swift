//
//  Expo1900 - ViewController.swift
//  Created by Kiwi, Finnn. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    lazy var validJson = decodeJson()
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = validJson?.title
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        guard let image = UIImage(named: "poster.png") else { return UIImageView() }
        imageView.image = image
        return imageView
    }()
    
    lazy var audienceLabel: UILabel = {
        let label = UILabel()
        guard let audienceNumber = validJson?.visitors,
              let formattedNumber = numberFormatter.string(from: audienceNumber as NSNumber) else { return UILabel() }
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "방문객 : \(formattedNumber) 명"
        return label
    }()
    
    lazy var venueLabel: UILabel = {
        let label = UILabel()
        guard let location = validJson?.location else { return UILabel() }
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "개최지 : \(location)"
        return label
    }()
    
    lazy var periodLabel: UILabel = {
        let label = UILabel()
        guard let duration = validJson?.duration else { return UILabel() }
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "개최기간 : \(duration)"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = validJson?.description
        label.numberOfLines = 0
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
    
    func decodeJson() -> Expo? {
        let decoder = JSONDecoder()
        
        guard let fileLocation = Bundle.main.url(forResource: "exposition_universelle_1900", withExtension: "json"),
              let data = try? Data(contentsOf: fileLocation),
              let expoInfo =  try? decoder.decode(Expo.self, from: data) else { return nil }
        return expoInfo
    }
}

