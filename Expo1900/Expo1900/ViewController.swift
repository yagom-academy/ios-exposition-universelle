//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonAnalyzer = JSONAnalyzer()
        guard let data = jsonAnalyzer.readFile(forName: "exposition_universelle_1900", Exposition.self) else {
            return
        }
        
        titleLabel.text = data.title
        visitorsLabel.text = "방문객 : \(String(data.visitors)) 명"
    }
}
