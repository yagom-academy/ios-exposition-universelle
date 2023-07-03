//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private let expositionDataManager = ExpositionDataManager()
    private var internationalExposition: InternationalExposition?
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let mainStackView = MainStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

private extension MainViewController {
    func configureMainView() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
    }
    
    func addConstraints() {
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
    
    func configureMainStackView() {
        guard let internationalExposition = internationalExposition else { return }
        
        mainStackView.titleLabel.text = internationalExposition.title.replacingOccurrences(of: "(", with: "\n(")
        mainStackView.descriptionLabel.text = internationalExposition.description
        
        configureVisitorsStackView(internationalExposition: internationalExposition)
        configureLocationStackView(internationalExposition: internationalExposition)
        configureDurationStackView(internationalExposition: internationalExposition)
        
        mainStackView.buttonStackView.exhibitListChangeViewButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func configureVisitorsStackView(internationalExposition: InternationalExposition) {
        let formattedVisitors = internationalExposition.visitors.formatToDecimal()
        mainStackView.visitorsStackView.dataLabel.text = ": \(formattedVisitors) 명"
    }
    
    func configureLocationStackView(internationalExposition: InternationalExposition) {
        mainStackView.locationStackView.dataLabel.text = ": \(internationalExposition.location)"
    }
    
    func configureDurationStackView(internationalExposition: InternationalExposition) {
        mainStackView.durationStackView.dataLabel.text = ": \(internationalExposition.duration)"
    }
    
    @objc private func didTapButton() {
        navigationController?.pushViewController(ExhibitListViewController(), animated: true)
    }
    
}
