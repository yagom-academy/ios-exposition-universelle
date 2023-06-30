//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController, MainViewDelegate {
    private lazy var mainView: MainView = {
        let view = MainView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpConstraints()
        loadMainViewInformation()
        setNavigationTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureUI() {
        view.addSubview(mainView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadMainViewInformation() {
        guard let information: ParisExpositionInformation = Decoder.decode(file: .parisExposition) else { return }
        
        mainView.loadInformation(information: information)
    }
    
    private func setNavigationTitle() {
        navigationItem.backButtonTitle = ExpositionTitle.main
    }
}

// MARK: - MainView Delegate
extension MainViewController {
    func pushKoreaEntryViewController() {
        let koreaEntryViewController = KoreaEntryViewController()
        
        navigationController?.pushViewController(koreaEntryViewController, animated: true)
    }
}
