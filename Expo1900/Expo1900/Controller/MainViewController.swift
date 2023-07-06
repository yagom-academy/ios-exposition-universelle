//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    private let expositionDataManager = ExpositionDataManager()
    private var internationalExposition: InternationalExposition?
    private let mainScrollView = UIScrollView()
    private let mainStackView = MainStackView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = false
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = true
        navigationController?.isNavigationBarHidden = false
    }
}

private extension MainViewController {
    func configureInit() {
        self.title = DataNamespace.main
        view.backgroundColor = .systemBackground
        internationalExposition = expositionDataManager.decodeExpositionJSON()
        
        configureMainView()
    }
    
    func configureMainView() {
        addSubviews()
        configureMainStackView()
        addConstraintsStackView()
        addConstraintsScrollView()
    }
    
    func addSubviews() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
    }
    
    func configureMainStackView() {
        guard let internationalExposition = internationalExposition else { return }
        
        configureTitle(at: internationalExposition)
        configureVisitorsStackView(at: internationalExposition)
        configureLocationStackView(at: internationalExposition)
        configureDurationStackView(at: internationalExposition)
        configureButtonStackView()
    }
    
    func configureTitle(at internationalExposition: InternationalExposition) {
        mainStackView.titleLabel.text = internationalExposition.title.replacingOccurrences(of: "(", with: "\n(")
        mainStackView.descriptionLabel.text = internationalExposition.description
    }
    
    func configureVisitorsStackView(at internationalExposition: InternationalExposition) {
        let formattedVisitors = internationalExposition.visitors.formatToDecimal()
        mainStackView.visitorsStackView.dataLabel.text = ": \(formattedVisitors) 명"
    }
    
    func configureLocationStackView(at internationalExposition: InternationalExposition) {
        mainStackView.locationStackView.dataLabel.text = ": \(internationalExposition.location)"
    }
    
    func configureDurationStackView(at internationalExposition: InternationalExposition) {
        mainStackView.durationStackView.dataLabel.text = ": \(internationalExposition.duration)"
    }
    
    func configureButtonStackView() {
        mainStackView.buttonStackView.exhibitListChangeViewButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let exhibitListViewController = ExhibitListViewController(expositionItems: expositionDataManager.decodeExpositionItemsJSON())
        navigationController?.pushViewController(exhibitListViewController, animated: true)
    }
    
    func addConstraintsStackView() {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func addConstraintsScrollView() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20),
            mainStackView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -40),
            mainStackView.buttonStackView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor)
        ])
    }
}

