//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Max, Whales.

import UIKit

class ExpositionViewController: UIViewController {
    private let expositionEntity = DecodingManager().decodeExpositionJSON()
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let mainStackView: MainStackView = MainStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = ViewControllerTitleNamespace.main
        
        configureMainStackView()
        configureMainView()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func configureMainView() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20),
            mainStackView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -40),
            
            mainStackView.buttonStackView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor)
        ])
    }
    
    private func configureMainStackView() {
        mainStackView.titleLabel.text = expositionEntity.title.replacingOccurrences(of: "(", with: "\n(")
        mainStackView.descriptionLabel.text = expositionEntity.description
        
        let formattedVisitors = expositionEntity.visitors.formatToDecimal()
        
        mainStackView.visitorsStackView.dataLabel.text = ": \(formattedVisitors) 명"
        mainStackView.locationStackView.dataLabel.text = ": \(expositionEntity.location)"
        mainStackView.durationStackView.dataLabel.text = ": \(expositionEntity.duration)"
        
        mainStackView.buttonStackView.changeViewButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        navigationController?.pushViewController(ExpositionItemViewController(), animated: true)
    }
}
