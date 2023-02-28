//
//  Expo1900 - MainViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var visitorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var pushExpoItemListViewButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러 가기", for: .normal)
        
        return button
    }()
    
    private var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var decodedExposition: ExpositionDecoder = ExpositionDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubView()
        setUpView()
        decodedExposition.decodeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupSubView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(posterImageView)
        scrollView.addSubview(visitorsLabel)
        scrollView.addSubview(locationLabel)
        scrollView.addSubview(durationLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(pushExpoItemListViewButton)
        scrollView.addSubview(flagImage)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -20),
            
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            posterImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            visitorsLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 10),
            visitorsLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            visitorsLabel.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            durationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            durationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            pushExpoItemListViewButton.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 10),
            pushExpoItemListViewButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            pushExpoItemListViewButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            pushExpoItemListViewButton.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            pushExpoItemListViewButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    
    private func setUpView() {
        titleLabel.text = decodedExposition.exposition.title.replacingOccurrences(of: NameSpace.bracket, with: NameSpace.enterBracket)
        visitorsLabel.text = NameSpace.visitor + decodedExposition.exposition.visitors.convertDecimal() + NameSpace.person
        locationLabel.text = NameSpace.location + decodedExposition.exposition.location
        durationLabel.text = NameSpace.duration + decodedExposition.exposition.duration
        descriptionLabel.text = decodedExposition.exposition.description
        descriptionLabel.numberOfLines = 0
        posterImageView.image = UIImage(named: "poster")
    }
}


