//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var expositionEntity: ExpositionEntity?
    private var isSetUpEntity: Bool = false
    
    private let verticalStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()
    
    private let mainScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpEntity()
        configureUI()
    }

    private func setUpEntity() {
        guard let expositionUniverselleEntity = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        
        let decorder = JSONDecoder()
        
        do {
            expositionEntity = try decorder.decode(ExpositionEntity.self, from: expositionUniverselleEntity.data)
            isSetUpEntity = true
        } catch {
            isSetUpEntity = false
        }
    }
    
    private func configureUI() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainScrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

