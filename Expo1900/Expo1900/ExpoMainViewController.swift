//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoMainViewController: UIViewController {
    
    let expoScrollView = UIScrollView()
    let expoContentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func decodeExpoUniverselle() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "expo_assets") else {
            return
        }
        let data = dataAsset.data
        
        do {
            let result = try decoder.decode(ExpoUniverselle.self, from: data)
        } catch {
            print("parsing failed")
        }
    }
    
    func setExpoScrollViewConstraints() {
        view.addSubview(expoScrollView)
        expoScrollView.addSubview(expoContentView)
        
        expoScrollView.translatesAutoresizingMaskIntoConstraints = false
        expoContentView.translatesAutoresizingMaskIntoConstraints = false
        
        let expoScrollViewConstraints: [NSLayoutConstraint] = ([
            expoScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            expoScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            expoScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expoScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let expoContentViewConstraints: [NSLayoutConstraint] = ([
            expoContentView.topAnchor.constraint(equalTo: expoScrollView.topAnchor),
            expoContentView.bottomAnchor.constraint(equalTo: expoScrollView.bottomAnchor),
            expoContentView.leadingAnchor.constraint(equalTo: expoScrollView.leadingAnchor),
            expoContentView.trailingAnchor.constraint(equalTo: expoScrollView.trailingAnchor),
            expoContentView.widthAnchor.constraint(equalTo: expoScrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate(expoScrollViewConstraints)
        NSLayoutConstraint.activate(expoContentViewConstraints)
    }
}

