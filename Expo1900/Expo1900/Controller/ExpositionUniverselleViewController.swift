//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionUniverselleViewController: UIViewController {
    private var expositionUniverselle: ExpositionUniverselle?
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = expositionUniverselle?.title
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var visitorsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = expositionUniverselle?.numberOfVisitors
        label.textAlignment = .center

        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = expositionUniverselle?.location
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = expositionUniverselle?.duration
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var totalDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = expositionUniverselle?.totalDescription
        label.numberOfLines = 0
        
        return label
    }()
    
    private let posterImage: UIImageView = {
        let imageName: String = "poster"
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private let leftFlagImage: UIImageView = {
        let imageName: String = "flag"
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private let rightFlagImage: UIImageView = {
        let imageName: String = "flag"
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private let expositionItemListButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        return button
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let expositionUniverselleScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpositionUniverselle()

        horizontalStackView.addArrangedSubview(leftFlagImage)
        horizontalStackView.addArrangedSubview(expositionItemListButton)
        horizontalStackView.addArrangedSubview(rightFlagImage)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(posterImage)
        verticalStackView.addArrangedSubview(visitorsLabel)
        verticalStackView.addArrangedSubview(durationLabel)
        verticalStackView.addArrangedSubview(locationLabel)
        verticalStackView.addArrangedSubview(totalDescriptionLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        expositionUniverselleScrollView.addSubview(verticalStackView)
        view.addSubview(expositionUniverselleScrollView)
        
        NSLayoutConstraint.activate([
            expositionUniverselleScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            expositionUniverselleScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expositionUniverselleScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expositionUniverselleScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            verticalStackView.topAnchor.constraint(equalTo: expositionUniverselleScrollView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: expositionUniverselleScrollView.bottomAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: expositionUniverselleScrollView.widthAnchor)
        ])
    }
    
    private func decodeExpositionUniverselle() {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let json = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expositionUniverselle = try decoder.decode(ExpositionUniverselle.self, from: json.data)
        } catch {
            print(error)
        }
    }
}
