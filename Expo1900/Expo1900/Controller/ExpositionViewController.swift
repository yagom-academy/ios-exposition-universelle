//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Max, Whales.

import UIKit

class ExpositionViewController: UIViewController {
    private let expositionEntity = DecodingManager().decodeExpositionJSON()
    private var isSetUpEntity: Bool = false
    
    private let mainScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let verticalStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let buttonStackView = ChangeViewButtonStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = ViewControllerTitleNamespace.main
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func configureUI() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            mainScrollView
                .topAnchor
                .constraint(equalTo: view.topAnchor),
            mainScrollView
                .bottomAnchor
                .constraint(equalTo: view.bottomAnchor),
            mainScrollView
                .leftAnchor
                .constraint(equalTo: view.leftAnchor),
            mainScrollView
                .rightAnchor
                .constraint(equalTo: view.rightAnchor),
            
            verticalStackView
                .topAnchor
                .constraint(equalTo: mainScrollView.topAnchor, constant: 20),
            verticalStackView
                .bottomAnchor
                .constraint(equalTo: mainScrollView.bottomAnchor, constant: -20),
            verticalStackView
                .centerXAnchor
                .constraint(equalTo: mainScrollView.centerXAnchor),
            verticalStackView
                .widthAnchor
                .constraint(equalTo: mainScrollView.widthAnchor, constant: -40)
        ])
        
        configureStackView()
    }
    
    private func configureErrorLabel() {
        let errorLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = LabelTextNameSpace.errorMessage
            
            return label
        }()
        
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel
                .centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            errorLabel
                .centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureStackView() {
        let titleLabel = {
            let label = UILabel()
            label.text = expositionEntity.title.replacingOccurrences(of: "(", with: "\n(")
            label.font = .preferredFont(forTextStyle: .title1)
            label.numberOfLines = 0
            label.textAlignment = .center
            
            return label
        }()
        
        let posterImageView = {
            let image = UIImageView()
            image.image = UIImage(named: AssetNamespace.poster)
            
            return image
        }()
        
        let descriptionLabel = {
            let textLabel = UILabel()
            textLabel.text = expositionEntity.description
            textLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            textLabel.numberOfLines = 0
            
            return textLabel
        }()
        
        let formattedVisitors = "\(expositionEntity.visitors.formatToDecimal()) 명"
        
        let visitorsStackView = ExpositionInformationStackView()
        let locationStackView = ExpositionInformationStackView()
        let durationStackView = ExpositionInformationStackView()
        
        visitorsStackView.subtitleLabel.text = LabelTextNameSpace.visitors
        visitorsStackView.dataLabel.text = ": \(formattedVisitors)"
        locationStackView.subtitleLabel.text = LabelTextNameSpace.location
        locationStackView.dataLabel.text = ": \(expositionEntity.location)"
        durationStackView.subtitleLabel.text = LabelTextNameSpace.duration
        durationStackView.dataLabel.text = ": \(expositionEntity.duration)"
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(posterImageView)
        verticalStackView.addArrangedSubview(visitorsStackView)
        verticalStackView.addArrangedSubview(locationStackView)
        verticalStackView.addArrangedSubview(durationStackView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.changeViewButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonStackView
                .leftAnchor
                .constraint(equalTo: verticalStackView.leftAnchor, constant: 40),
            buttonStackView
                .rightAnchor
                .constraint(equalTo: verticalStackView.rightAnchor, constant: -40)
        ])
    }
    
    @objc private func didTapButton() {
        show(ExpositionItemViewController(), sender: verticalStackView)
    }
}
