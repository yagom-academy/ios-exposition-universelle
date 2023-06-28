//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var expositionEntity: ExpositionEntity?
    private var isSetUpEntity: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpEntity()
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
}

