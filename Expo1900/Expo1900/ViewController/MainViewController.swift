//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController, MainViewDelegate {
    lazy var mainView: MainView = {
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
        
        navigationItem.backButtonTitle = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func pushKoreaEntryViewController() {
        let koreaEntryViewController = KoreaEntryViewController()
        
        navigationController?.pushViewController(koreaEntryViewController, animated: true)
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
        let jsonDecoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            let data = try jsonDecoder.decode(ParisExpositionInformation.self, from: asset.data)
            mainView.loadInformation(information: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

