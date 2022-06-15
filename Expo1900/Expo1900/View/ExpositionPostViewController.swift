//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ExpositionPostViewController: UIViewController {
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2000).isActive = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let visitorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let leftFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        return imageView
    }()
    
    private let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        return imageView
    }()
    
    private let expositionEnterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private var expositionPostEntity: ExpositionPostEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setDefaultValue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

private extension ExpositionPostViewController {
    func setDefaultValue() {
        expositionPostEntity = JsonParser<ExpositionPostEntity>.fetch("ExpositionPost")
        
        titleLabel.text = expositionPostEntity?.manufacture(ExpositionPost.title)
        visitorLabel.text = expositionPostEntity?.manufacture(ExpositionPost.visitors)
        locationLabel.text = expositionPostEntity?.manufacture(ExpositionPost.location)
        durationLabel.text = expositionPostEntity?.manufacture(ExpositionPost.duration)
        descriptionLabel.text = expositionPostEntity?.manufacture(ExpositionPost.description)
        
        self.navigationController?.navigationBar.isHidden = true
        expositionEnterButton.addTarget(self, action: #selector(tappedExpositionEnterButton(_:)), for: .touchUpInside)
    }
    
    @objc func tappedExpositionEnterButton(_ sender: UIButton) {
        let expositionTableViewController = ExpositionTableViewController()
        self.navigationController?.pushViewController(expositionTableViewController, animated: true)
    }
}

// - MARK: view setting

private extension ExpositionPostViewController {
    func addSubview() {
        self.view.addSubview(contentScrollView)
        self.contentScrollView.addSubview(contentView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(postImageView)
        self.contentView.addSubview(visitorLabel)
        self.contentView.addSubview(locationLabel)
        self.contentView.addSubview(durationLabel)
        self.contentView.addSubview(descriptionLabel)
        
        self.contentView.addSubview(leftFlagImageView)
        self.contentView.addSubview(expositionEnterButton)
        self.contentView.addSubview(rightFlagImageView)
        
        setUpParentUIConstraints()
    }
    
    func setUpParentUIConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let contentLayoutGuide = contentScrollView.contentLayoutGuide
        let frameLayoutGuide = contentScrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            self.contentScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.contentScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.contentScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.contentScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            
            self.contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
        ])
        
        setUpChildUIContraints()
    }
    
    func setUpChildUIContraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            self.postImageView.widthAnchor.constraint(equalToConstant: 140),
            self.postImageView.heightAnchor.constraint(equalToConstant: 200),
            self.postImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.postImageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            
            self.visitorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            self.visitorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            self.visitorLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 10),
            
            self.locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            self.locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            self.locationLabel.topAnchor.constraint(equalTo: self.visitorLabel.bottomAnchor, constant: 10),
            
            self.durationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            self.durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            self.durationLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 10),
            
            self.descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.durationLabel.bottomAnchor, constant: 10),
            
            self.leftFlagImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            self.rightFlagImageView.topAnchor.constraint(equalTo: leftFlagImageView.topAnchor),
            self.expositionEnterButton.topAnchor.constraint(equalTo: leftFlagImageView.topAnchor),
            
            self.leftFlagImageView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 40),
            self.expositionEnterButton.leadingAnchor.constraint(equalTo: leftFlagImageView.trailingAnchor, constant: 30),
            self.rightFlagImageView.leadingAnchor.constraint(equalTo: expositionEnterButton.trailingAnchor, constant: 30),
        ])
    }
}
