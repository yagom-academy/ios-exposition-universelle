//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonAnalyzer = JSONAnalyzer()
        guard let data = jsonAnalyzer.readFile(forName: "exposition_universelle_1900", Exposition.self) else {
            return
        }
    }
}
