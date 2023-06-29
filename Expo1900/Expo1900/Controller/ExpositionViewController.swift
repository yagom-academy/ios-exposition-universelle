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
    
    private let mainStackView = MainStackView()
    
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
        mainScrollView.addSubview(mainStackView)
        
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
            
            mainStackView
                .topAnchor
                .constraint(equalTo: mainScrollView.topAnchor, constant: 20),
            mainStackView
                .bottomAnchor
                .constraint(equalTo: mainScrollView.bottomAnchor, constant: -20),
            mainStackView
                .centerXAnchor
                .constraint(equalTo: mainScrollView.centerXAnchor),
            mainStackView
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
        mainStackView.titleLabel.text = expositionEntity.title.replacingOccurrences(of: "(", with: "\n(")
        mainStackView.descriptionLabel.text = expositionEntity.description
        
        let formattedVisitors = "\(expositionEntity.visitors.formatToDecimal()) 명"
        
        mainStackView.visitorsStackView.subtitleLabel.text = LabelTextNameSpace.visitors
        mainStackView.visitorsStackView.dataLabel.text = ": \(formattedVisitors)"
        mainStackView.locationStackView.subtitleLabel.text = LabelTextNameSpace.location
        mainStackView.locationStackView.dataLabel.text = ": \(expositionEntity.location)"
        mainStackView.durationStackView.subtitleLabel.text = LabelTextNameSpace.duration
        mainStackView.durationStackView.dataLabel.text = ": \(expositionEntity.duration)"
        
        mainStackView.buttonStackView.changeViewButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mainStackView.buttonStackView
                .leftAnchor
                .constraint(equalTo: mainStackView.leftAnchor, constant: 40),
            mainStackView.buttonStackView
                .rightAnchor
                .constraint(equalTo: mainStackView.rightAnchor, constant: -40)
        ])
    }
    
    @objc private func didTapButton() {
        show(ExpositionItemViewController(), sender: mainStackView)
    }
}
