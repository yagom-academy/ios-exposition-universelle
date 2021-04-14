//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoMainViewController: UIViewController {
    
    let expoScrollView = UIScrollView()
    let expoContentView = UIView()
    let expoStackView = ExpoMainStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeExpoUniverselle()
        setExpoScrollViewConstraints()
    }

    func decodeExpoUniverselle() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        let data = dataAsset.data
        
        do {
            let result = try decoder.decode(ExpoUniverselle.self, from: data)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            guard let visitors = numberFormatter.string(from: NSNumber(value: result.visitors)) else {
                return
            }
            
            expoStackView.expoTitle.text = result.title
            expoStackView.visitorsText.text = visitors
            expoStackView.locationText.text = result.location
            expoStackView.durationText.text = result.duration
            expoStackView.expoDescription.text = result.description
        } catch {
            print("parsing failed")
        }
    }
    
    func setExpoScrollViewConstraints() {
        view.addSubview(expoScrollView)
        expoScrollView.addSubview(expoContentView)
        expoContentView.addSubview(expoStackView)
        
        expoScrollView.translatesAutoresizingMaskIntoConstraints = false
        expoContentView.translatesAutoresizingMaskIntoConstraints = false
        expoStackView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        let expoStackViewConstraints: [NSLayoutConstraint] = ([
            expoStackView.topAnchor.constraint(equalTo: expoContentView.layoutMarginsGuide.topAnchor, constant: 10),
            expoStackView.bottomAnchor.constraint(equalTo: expoContentView.layoutMarginsGuide.bottomAnchor, constant: 10),
            expoStackView.leadingAnchor.constraint(equalTo: expoContentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            expoStackView.trailingAnchor.constraint(equalTo: expoContentView.layoutMarginsGuide.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate(expoScrollViewConstraints)
        NSLayoutConstraint.activate(expoContentViewConstraints)
        NSLayoutConstraint.activate(expoStackViewConstraints)
    }
}

