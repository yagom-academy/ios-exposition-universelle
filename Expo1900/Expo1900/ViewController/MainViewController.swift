//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpConstraints()
        loadMainViewInformation()
    }
    
    private func configureUI() {
        view.addSubview(mainView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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

