//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController, MainViewDelegate {
    private let backButtonTitle = "메인"
    
    private lazy var mainView: MainView = {
        let view = MainView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor(.systemBackground)
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
        guard let information: ParisExpositionInformation = Decoder.decode(fileName: "exposition_universelle_1900") else { return }
        
        mainView.load(information: information)
    }
    
    private func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    private func setNavigationTitle() {
        navigationItem.backButtonTitle = backButtonTitle
    }
}

// MARK: - MainView Delegate
extension MainViewController {
    func didTappedKoreaEntryButton() {
        let koreaEntryViewController = KoreaEntryViewController()
        
        navigationController?.pushViewController(koreaEntryViewController, animated: true)
    }
}
