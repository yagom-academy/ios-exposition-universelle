//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var mainStackView: UIStackView!
    private let jsonDecoder = JSONDecoder()
    private var exposition: Exposition? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exposition = decodeExposition("exposition_universelle_1900")
    }
    
    private func decodeExposition(_ file: String) -> Exposition? {
        guard let expositionAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        let exposition = try? jsonDecoder.decode(Exposition.self, from: expositionAsset.data)
        
        return exposition
    }

}

