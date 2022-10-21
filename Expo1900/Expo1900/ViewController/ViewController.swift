//
//  ViewController.swift
//  ViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

class ViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let posterImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "poster"))
        return image
    }()
    
    let visitorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let leftFlagImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "flag"))
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    let rightFlagImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "flag"))
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()

    
    let entryButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        return button
    }()
    
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exposition = decode()
        setLayout()
        setViewData()
    }
    
    private func setLayout() {
        let stackView = UIStackView(arrangedSubviews: [leftFlagImageView, entryButton, rightFlagImageView])
        
        stackView.alignment = .center
        
        let layoutList: [UIView] = [
            titleLabel,
            posterImageView,
            visitorsLabel,
            locationLabel,
            durationLabel,
            descriptionLabel,
            stackView
        ]
        let safeArea = view.safeAreaLayoutGuide
        
        layoutList.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(element)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            posterImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            visitorsLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            visitorsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            visitorsLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            durationLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            durationLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ])
    }
    
    private func setViewData() {
        titleLabel.text = exposition?.titleData
        visitorsLabel.text = exposition?.visitorsData
        locationLabel.text = exposition?.locationData
        durationLabel.text = exposition?.durationData
        descriptionLabel.text = exposition?.description
    }
    
    private func decode() -> Exposition? {
        let jsonDecoder = JSONDecoder()
        let json = NSDataAsset(name: "exposition_universelle_1900")
        
        guard let result = try? jsonDecoder.decode(Exposition.self, from: json?.data ?? Data()) else {
            return nil
        }
        
        return result
    }
}
